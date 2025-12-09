function varargout = InterfazRK(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterfazRK_OpeningFcn, ...
                   'gui_OutputFcn',  @InterfazRK_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before InterfazRK is made visible.
function InterfazRK_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

set(handles.comparar, 'Visible', 'off');     

set(handles.resultado2, 'Visible', 'off');   
set(handles.resultado3, 'Visible', 'off');  
set(handles.error2, 'Visible', 'off');       
set(handles.error3, 'Visible', 'off');       

set(handles.OrangeKutta, 'Visible', 'off'); 
set(handles.orangeK, 'Visible', 'off'); 
set(handles.orangeE, 'Visible', 'off'); 
set(handles.sqareskyblue, 'Visible', 'off'); 
set(handles.skyblueE, 'Visible', 'off'); 
set(handles.skyblueTay, 'Visible', 'off'); 
    
    


% --- Outputs from this function are returned to the command line.
function varargout = InterfazRK_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function funcion_Callback(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcion as text
%        str2double(get(hObject,'String')) returns contents of funcion as a double


% --- Executes during object creation, after setting all properties.
function funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x0_Callback(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0 as text
%        str2double(get(hObject,'String')) returns contents of x0 as a double


% --- Executes during object creation, after setting all properties.
function x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y0_Callback(hObject, eventdata, handles)
% hObject    handle to y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y0 as text
%        str2double(get(hObject,'String')) returns contents of y0 as a double


% --- Executes during object creation, after setting all properties.
function y0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xn_Callback(hObject, eventdata, handles)
% hObject    handle to xn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xn as text
%        str2double(get(hObject,'String')) returns contents of xn as a double


% --- Executes during object creation, after setting all properties.
function xn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function n_Callback(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n as text
%        str2double(get(hObject,'String')) returns contents of n as a double


% --- Executes during object creation, after setting all properties.
function n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calcular.
function calcular_Callback(hObject, eventdata, handles)
    f_txt = get(handles.funcion, 'String');
    if isempty(f_txt)
        errordlg('Ingrese la función dy/dx = f(x,y).','Dato faltante');
        uicontrol(handles.funcion);
        return;
    end

    f = str2func(['@(x,y)' f_txt]);

    x0 = str2double(get(handles.x0, 'String'));
    if isnan(x0)
        errordlg('x0 debe ser un número real.','Dato inválido');
        uicontrol(handles.x0);
        return;
    end
    
    y0 = str2double(get(handles.y0, 'String'));
    if isnan(y0)
        errordlg('y0 debe ser un número real.','Dato inválido');
        uicontrol(handles.y0);
        return;
    end
    xn = str2double(get(handles.xn, 'String'));
    n = str2double(get(handles.n, 'String'));
    if n <= 0 || n ~= round(n)
        errordlg('n debe ser un entero positivo.','Dato inválido');
        uicontrol(handles.n);
        return;
    end
    if isnan(n)
        errordlg('n debe ser un número real.','Dato inválido');
        uicontrol(handles.n);
        return;
    end
    

    [X1, Y1] = edoRK4(f, x0, y0, xn, n);
    C  = Y1(end);
    
    [~, Y2] = edoRK4(f, x0, y0, xn, 2*n);
    C2 = Y2(end);

    error1 = abs(C2 - C);

    set(handles.resultado1, 'String', num2str(C));
    set(handles.comparar, 'Visible', 'on');      

    % Asegurar que RK2 y Taylor sigan ocultos hasta presionar comparar:
    set(handles.resultado2, 'Visible', 'off');
    set(handles.resultado3, 'Visible', 'off');  
    set(handles.error2, 'Visible', 'off');
    set(handles.error3, 'Visible', 'off');
    set(handles.error1,'String', num2str(error1));

    axes(handles.axes1);  
    plot(X1, Y1, 'b.-', 'LineWidth', 1.5);
    grid on;
    xlabel('x');
    ylabel('y(x)');
    title('Solución usando RK4');
    
    
function limpiar_Callback(hObject, eventdata, handles)
    set(handles.funcion, 'String', '');
    set(handles.x0, 'String', '');
    set(handles.y0, 'String', '');
    set(handles.xn, 'String', '');
    set(handles.n, 'String', '');

    set(handles.resultado1, 'String', '');
    set(handles.resultado2, 'String', ''); 
    set(handles.resultado3, 'String', '');
    set(handles.error1, 'String', ''); 
    set(handles.error2, 'String', '');
    set(handles.error3, 'String', ''); 
    axes(handles.axes1);
    cla reset;     
    grid off;
    title('');

    guidata(hObject, handles);
    
    set(handles.comparar, 'Visible', 'off');
    set(handles.resultado2, 'Visible', 'off');
    set(handles.resultado3, 'Visible', 'off');
    set(handles.error2, 'Visible', 'off');
    set(handles.error3, 'Visible', 'off');
    set(handles.OrangeKutta, 'Visible', 'off'); 
    set(handles.orangeK, 'Visible', 'off'); 
    set(handles.orangeE, 'Visible', 'off'); 
    set(handles.sqareskyblue, 'Visible', 'off'); 
    set(handles.skyblueE, 'Visible', 'off'); 
    set(handles.skyblueTay, 'Visible', 'off'); 


function comparar_Callback(hObject, eventdata, handles)

    f_txt = get(handles.funcion, 'String');
    f = str2func(['@(x,y)' f_txt]);

    x0 = str2double(get(handles.x0, 'String'));
    y0 = str2double(get(handles.y0, 'String'));
    xn = str2double(get(handles.xn, 'String'));
    n  = str2double(get(handles.n, 'String'));
    
    [~, Y1] = edoRK4(f, x0, y0, xn, n);
    C  = Y1(end);
    RK2 = Eddo_RK2(f, x0, y0, xn, n);             
    T2  = edo_taylor(f, x0, y0, xn, n);     
    E2 = abs(C - RK2);
    E3 = abs(C - T2); 
    
    set(handles.resultado2, 'String', num2str(RK2));
    set(handles.resultado3, 'String', num2str(T2));
    set(handles.error2, 'String', num2str(E2)); 
    set(handles.error3, 'String', num2str(E3)); 
    
    set(handles.resultado2, 'Visible', 'on');
    set(handles.resultado3, 'Visible', 'on');
    set(handles.error2, 'Visible', 'on');
    set(handles.error3, 'Visible', 'on');
    set(handles.OrangeKutta, 'Visible', 'on'); 
    set(handles.orangeK, 'Visible', 'on'); 
    set(handles.orangeE, 'Visible', 'on'); 
    set(handles.sqareskyblue, 'Visible', 'on'); 
    set(handles.skyblueE, 'Visible', 'on'); 
    set(handles.skyblueTay, 'Visible', 'on'); 



    
    
