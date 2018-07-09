pathname = cd; %gets directory
files = dir(fullfile(pathname,'*png'));
n = length(files);
dest = strcat(pathname, '\', 'FAZsegAutoCCL');

% 
for i = 1:n
    source = strcat(pathname, '\', files(i).name(1:end-4));

    % go to source folder and copy
    cd(source)
    copyfile('*FAZAutoCCL.png', dest)
    
    % Go back
    cd ../
 end