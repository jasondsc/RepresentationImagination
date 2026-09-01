function create_VGC_stims

    %% read in mazes from json file and seperate them into workable cell arrays
    % this snippet of code reads in the mazes
    fileName = './mazes/mazes_OriginalSperling.json'; % filename in JSON extension
    str = fileread(fileName); % dedicated for reading files as text
    data = jsondecode(str); % Using the jsondecode function to parse JSON from string
    data=struct2cell(data);
    mazes_original= cellfun(@cell2mat, data, 'UniformOutput', false);

    % ALL mazes are left oriented

    % seperate out left right lateralized
    right_mazes= mazes_original;

    % repreat for small changes 
    fileName = './mazes/mazes_NewGoalSmallSperling.json'; % filename in JSON extension
    str = fileread(fileName); % dedicated for reading files as text
    data = jsondecode(str); % Using the jsondecode function to parse JSON from string
    data=struct2cell(data);
    mazes_small= cellfun(@cell2mat, data, 'UniformOutput', false);

    left_mazes= cellfun(@fliplr, mazes_small, 'UniformOutput', false);
    left_mazes2= cellfun(@fliplr, mazes_original, 'UniformOutput', false);

    % repreat for large changes 
    fileName = './mazes/mazes_NewGoalLargeSperling.json'; % filename in JSON extension
    str = fileread(fileName); % dedicated for reading files as text
    data = jsondecode(str); % Using the jsondecode function to parse JSON from string
    data=struct2cell(data);
    mazes_large= cellfun(@cell2mat, data, 'UniformOutput', false);

    right_mazes_ud= cellfun(@flipud, mazes_large, 'UniformOutput', false);
    right_mazes_ud2= cellfun(@flipud, mazes_original, 'UniformOutput', false);

    fileName = './mazes/mazes_InvertedSperling.json'; % filename in JSON extension
    str = fileread(fileName); % dedicated for reading files as text
    data = jsondecode(str); % Using the jsondecode function to parse JSON from string
    data=struct2cell(data);
    mazes_inverted= cellfun(@cell2mat, data, 'UniformOutput', false);

    mazes_inverted = cellfun(@fliplr, mazes_inverted, 'UniformOutput', false);
    left_mazes_ud= cellfun(@flipud, mazes_inverted, 'UniformOutput', false);

    left_mazes_ud2=cellfun(@fliplr, mazes_original, 'UniformOutput', false);
    left_mazes_ud2=cellfun(@flipud, left_mazes_ud2, 'UniformOutput', false);


    %% convert mazes to RGB

    for i=1:12

        temp=right_mazes{i};
        tempint= cell(11,11);
        tempint(temp == '.') = {[1,1,1]};
        tempint(temp == '#') = {[0,0,0]};
        tempint(temp == 'G') = {[0,1,0]};
        tempint(temp == 'S') = {[1,0.6,0.9]};
        tempint(cellfun(@isempty, tempint)) = {[0.5,0.5,1]};
        stim_right_mazes_orig{i,1} = tempint;

        temp=left_mazes2{i};
        tempint= cell(11,11);
        tempint(temp == '.') = {[1,1,1]};
        tempint(temp == '#') = {[0,0,0]};
        tempint(temp == 'G') = {[0,1,0]};
        tempint(temp == 'S') = {[1,0.6,0.9]};
        tempint(cellfun(@isempty, tempint)) = {[0.5,0.5,1]};
        stim_left_mazes_orig {i,1} = tempint;

        temp=right_mazes_ud2{i};
        tempint= cell(11,11);
        tempint(temp == '.') = {[1,1,1]};
        tempint(temp == '#') = {[0,0,0]};
        tempint(temp == 'G') = {[0,1,0]};
        tempint(temp == 'S') = {[1,0.6,0.9]};
        tempint(cellfun(@isempty, tempint)) = {[0.5,0.5,1]};
        stim_right_ud_mazes_orig{i,1} = tempint;

        temp=left_mazes_ud2{i};
        tempint= cell(11,11);
        tempint(temp == '.') = {[1,1,1]};
        tempint(temp == '#') = {[0,0,0]};
        tempint(temp == 'G') = {[0,1,0]};
        tempint(temp == 'S') = {[1,0.6,0.9]};
        tempint(cellfun(@isempty, tempint)) = {[0.5,0.5,1]};
        stim_left_ud_mazes_orig {i,1} = tempint;

        temp=left_mazes{i};
        tempint= cell(11,11);
        tempint(temp == '.') = {[1,1,1]};
        tempint(temp == '#') = {[0,0,0]};
        tempint(temp == 'G') = {[0,1,0]};
        tempint(temp == 'S') = {[1,0.6,0.9]};
        tempint(cellfun(@isempty, tempint)) = {[0.5,0.5,1]};
        stim_left_mazes_new{i,1} = tempint;

        temp=right_mazes_ud{i};
        tempint= cell(11,11);
        tempint(temp == '.') = {[1,1,1]};
        tempint(temp == '#') = {[0,0,0]};
        tempint(temp == 'G') = {[0,1,0]};
        tempint(temp == 'S') = {[1,0.6,0.9]};
        tempint(cellfun(@isempty, tempint)) = {[0.5,0.5,1]};
        stim_right_ud_mazes_new{i,1} = tempint;

        temp=left_mazes_ud{i};
        tempint= cell(11,11);
        tempint(temp == '.') = {[1,1,1]};
        tempint(temp == '#') = {[0,0,0]};
        tempint(temp == 'G') = {[0,1,0]};
        tempint(temp == 'S') = {[1,0.6,0.9]};
        tempint(cellfun(@isempty, tempint)) = {[0.5,0.5,1]};
        stim_left_ud_mazes_new{i,1} = tempint;

    end


    stats=readtable('./mazes/OriginalMazeStats.csv');
    sVGC_right_mazes_orig= reshape([stats.sVGC(1:72)]', [6,12]);
    dVGC_right_mazes_orig= reshape([stats.dVGC(1:72)]', [6,12]);

    stats=readtable('./mazes/NewGoalSmallMazeStats.csv');
    sVGC_right_mazes_small= reshape([stats.sVGC(1:72)]', [6,12]);
    dVGC_right_mazes_small= reshape([stats.dVGC(1:72)]', [6,12]);

    stats=readtable('./mazes/NewGoalLargelMazeStats.csv');
    sVGC_right_mazes_large= reshape([stats.sVGC(1:72)]', [6,12]);
    dVGC_right_mazes_large= reshape([stats.dVGC(1:72)]', [6,12]);
    
    save('./StimMazes_RGB_4_Matlab.mat', ...
        'right_mazes', 'left_mazes', 'right_mazes_ud', 'left_mazes_ud',...
        'stim_right_mazes_orig',  'stim_left_mazes_orig', 'stim_right_ud_mazes_orig', 'stim_left_ud_mazes_orig',...
        'stim_left_mazes_new', 'stim_right_ud_mazes_new', 'stim_left_ud_mazes_new',...
        'dVGC_right_mazes_orig',"dVGC_right_mazes_small" , "dVGC_right_mazes_large",...
        'sVGC_right_mazes_orig', 'sVGC_right_mazes_small', 'sVGC_right_mazes_large')

end