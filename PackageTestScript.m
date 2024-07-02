clc; clear;
%% Check MBTOP version in XML file
try
    evidence_xml = fileread("evidence.xml");
    if(contains(evidence_xml, 'MBTOP 1.5.0 (R9.1)'))
        disp("MBTOP Version in XML file is 1.5.0 (R9.1)");
    else
        error("Incorrect MBTOP Version");
    end
catch 
    error('File not found.');
end
%% Check MBTOP version in HTML file
try
    evidence_html = fileread("evidence.html");
    if(contains(evidence_html, 'MBTOP 1.5.0 (R9.1)'))
        disp("MBTOP Version in HTML file is 1.5.0 (R9.1)");
    else
        error("Incorrect MBTOP Version");
    end
catch 
    error('File not found.');
end
%% Check MBTOP version in MATLAB ver command
try
    MBTOP_ver = ver('MBTOP');
    if(strcmp(MBTOP_ver.Version,'1.5.0') && strcmp(MBTOP_ver.Release, '(R9.1)'))
        disp("MBTOP Version in Matlab is 1.5.0 (R9.1)");
    else
        error("Incorrect MBTOP Version");
    end
catch ME
    error('MBTOP not found.');
end
%% Check MBTOP version in Programs List
[status, cmdout] = system('wmic product get name, version');
if(status)
    error("Error Running WMIC command");
else
    if(contains(erase(cmdout, ' '), 'MBTOP1.5.0'))
        disp("MBTOP Version in Programs List is 1.5.0");
    else
        error("Incorrect MBTOP Version");
    end
end