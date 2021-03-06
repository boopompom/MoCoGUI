function iNImgs = fLargePopup(cShow)
% show popup figure for selection of shown images (EvalGUI)
%
% input:
% cShow             cell array with image names
%
% output:
% iNImgs            selected images
%
% -------------------------------------------------------------------------
% (c) 2015: Thomas Kuestner
% -------------------------------------------------------------------------

iFIGUREWIDTH = 400;
iFIGUREHEIGHT = 600;
iTEXTWIDTH = 200;
iTEXTHEIGHT = 15;
iBUTTONHEIGHT = 24;

if(length(cShow) > 2)
    iLISTBOXWIDTH = iFIGUREWIDTH/2;
    iLISTBOXHEIGHT = (iFIGUREHEIGHT-iBUTTONHEIGHT-2*iTEXTHEIGHT)/2;
else
    iLISTBOXWIDTH = iFIGUREWIDTH/2;
    iLISTBOXHEIGHT = iFIGUREHEIGHT-iBUTTONHEIGHT-iTEXTHEIGHT;
end

iNImgs = [];
iPos = get(0, 'ScreenSize');

% -------------------------------------------------------------------------
% Create figure and GUI elements
hF = figure( ...
    'Position'              , [(iPos(3) - iFIGUREWIDTH)/2, (iPos(4) - iFIGUREHEIGHT)/2, iFIGUREWIDTH, iFIGUREHEIGHT], ...
    'Units'                 , 'pixels', ...
    'DockControls'          , 'off', ...
    'WindowStyle'           , 'modal', ...
    'Name'                  , 'Choose shown images', ...
    'NumberTitle'           , 'off', ...
    'Resize'                , 'off');

hText1 = uicontrol('position',[1,iFIGUREHEIGHT-iTEXTHEIGHT,iTEXTWIDTH,iTEXTHEIGHT],'style','text','String','Image 01');
hList1 = uicontrol(hF, ...
    'Style'                 , 'listbox', ...
    'Units'                 , 'pixels', ...
    'Position'              , [1 iFIGUREHEIGHT-iTEXTHEIGHT-iLISTBOXHEIGHT iLISTBOXWIDTH iLISTBOXHEIGHT], ...
    'ForegroundColor'       , 'w' , ...
    'BackgroundColor'       , 'k', ...
    'HitTest'               , 'on', ...
    'String'                , cShow, ...
    'Min'                   , 0, ...
    'Max'                   , 1, ...
    'Value'                 , 1, ...
    'Callback'              , @fMouseActionFcn);

hText2 = uicontrol('position',[iLISTBOXWIDTH+1,iFIGUREHEIGHT-iTEXTHEIGHT,iTEXTWIDTH,iTEXTHEIGHT],'style','text','String','Image 02');
hList2 = uicontrol(hF, ...
    'Style'                 , 'listbox', ...
    'Units'                 , 'pixels', ...
    'Position'              , [iLISTBOXWIDTH+1 iFIGUREHEIGHT-iTEXTHEIGHT-iLISTBOXHEIGHT iLISTBOXWIDTH iLISTBOXHEIGHT], ...
    'ForegroundColor'       , 'w' , ...
    'BackgroundColor'       , 'k', ...
    'HitTest'               , 'on', ...
    'String'                , cShow(2:end), ...
    'Min'                   , 0, ...
    'Max'                   , 1, ...
    'Value'                 , 1, ...
    'Callback'              , @fMouseActionFcn);

if(length(cShow) > 2)
    hText3 = uicontrol('position',[1,iFIGUREHEIGHT-iLISTBOXHEIGHT-2*iTEXTHEIGHT,iTEXTWIDTH,iTEXTHEIGHT],'style','text','String','Image 03');
    hList3 = uicontrol(hF, ...
        'Style'                 , 'listbox', ...
        'Units'                 , 'pixels', ...
        'Position'              , [1 iBUTTONHEIGHT+1 iLISTBOXWIDTH iLISTBOXHEIGHT], ...
        'ForegroundColor'       , 'w' , ...
        'BackgroundColor'       , 'k', ...
        'HitTest'               , 'on', ...
        'String'                , cShow(2:end), ...
        'Min'                   , 0, ...
        'Max'                   , 1, ...
        'Value'                 , 2, ...
        'Callback'              , @fMouseActionFcn);
end

if(length(cShow) > 3)
    hText4 = uicontrol('position',[iLISTBOXWIDTH+1,iFIGUREHEIGHT-iLISTBOXHEIGHT-2*iTEXTHEIGHT,iTEXTWIDTH,iTEXTHEIGHT],'style','text','String','Image 04');
    hList4 = uicontrol(hF, ...
        'Style'                 , 'listbox', ...
        'Units'                 , 'pixels', ...
        'Position'              , [iLISTBOXWIDTH+1 iBUTTONHEIGHT+1 iLISTBOXWIDTH iLISTBOXHEIGHT], ...
        'ForegroundColor'       , 'w' , ...
        'BackgroundColor'       , 'k', ...
        'HitTest'               , 'on', ...
        'String'                , cShow(2:end), ...
        'Min'                   , 0, ...
        'Max'                   , 1, ...
        'Value'                 , 3, ...
        'Callback'              , @fMouseActionFcn);
end

hButOK = uicontrol(hF, ...
    'Style'                 , 'pushbutton', ...
    'Units'                 , 'pixels', ...
    'Position'              , [1 1 iFIGUREWIDTH/2 iBUTTONHEIGHT], ...
    'ForegroundColor'       , 'w', ...
    'BackgroundColor'       , 'k', ...
    'Callback'              , @fMouseActionFcn, ...
    'HitTest'               , 'on', ...
    'String'                , 'OK');

hButCancel = uicontrol(hF, ...
    'Style'                 , 'pushbutton', ...
    'Units'                 , 'pixels', ...
    'Position'              , [iFIGUREWIDTH/2 + 1 1 iFIGUREWIDTH/2 iBUTTONHEIGHT], ...
    'ForegroundColor'       , 'w', ...
    'BackgroundColor'       , 'k', ...
    'Callback'              , @fMouseActionFcn, ...
    'HitTest'               , 'on', ...
    'String'                , 'Cancel');
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% Set default action and enable gui interaction
sAction = 'Cancel';
uiwait(hF);
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% uiresume was triggered (in fMouseActionFcn) -> return
try
    if strcmp(sAction, 'OK')
        
        if(length(cShow) == 2)
            iNImgs = [get(hList1, 'Value'), get(hList2, 'Value')+1];
        elseif(length(cShow) == 3)
            iNImgs = [get(hList1, 'Value'), get(hList2, 'Value')+1, get(hList3, 'Value')+1];
        else
            iNImgs = [get(hList1, 'Value'), get(hList2, 'Value')+1, get(hList3, 'Value')+1, get(hList4, 'Value')+1];
        end
%         csVarOut = cell(length(iList), 1);
%         for iI = 1:length(iList)
%             csVarOut(iI) = csVars(iList(iI));
%         end
    end
    close(hF);
catch %#ok<CTCH>
    iNImgs = [];
end
% -------------------------------------------------------------------------


    % = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
    % * *
    % * * NESTED FUNCTION fMouseActionFcn (nested in fGetRefImg)
    % * *
    % * * Determine whether axes are linked
	% * *
    % = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
    function fMouseActionFcn(hObject, eventdata)
        % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        % React on action depending on its source component
        switch(hObject)
            
            % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            % Click in LISTBOX: return if double-clicked
            case {hList1,hList2,hList3,hList4}
                if strcmp(get(hF, 'SelectionType'), 'open')
                    sAction = 'OK';
                    uiresume(hF);
                end
            % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            
            % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            % OK button
            case hButOK
                sAction = 'OK';
                uiresume(hF);
            % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            
            % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            % CANCEL button
            case hButCancel
                sAction = 'Cancel';
                uiresume(hF);
            % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

            otherwise

        end
        % End of switch statement
        % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    % = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
    % * * END NESTED FUNCTION fGridMouseMoveFcn
	% = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
    end
end