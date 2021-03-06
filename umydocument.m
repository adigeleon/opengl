function varargout = umydocument(varargin)
% UMYDOCUMENT MATLAB code for umydocument.fig
%      UMYDOCUMENT, by itself, creates a new UMYDOCUMENT or raises the existing
%      singleton*.
%
%      H = UMYDOCUMENT returns the handle to a new UMYDOCUMENT or the handle to
%      the existing singleton*.
%
%      UMYDOCUMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UMYDOCUMENT.M with the given input arguments.
%
%      UMYDOCUMENT('Property','Value',...) creates a new UMYDOCUMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before umydocument_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to umydocument_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help umydocument

% Last Modified by GUIDE v2.5 24-Apr-2017 01:10:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @umydocument_OpeningFcn, ...
                   'gui_OutputFcn',  @umydocument_OutputFcn, ...
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


% --- Executes just before umydocument is made visible.
function umydocument_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to umydocument (see VARARGIN)

% Choose default command line output for umydocument
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes umydocument wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = umydocument_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img img2
[path, user_cancel] = imgetfile();
if user_cancel
    msgbox(sprintf('error'),'Error','Error');
    return
end
img = imread(path);
img = im2double(img);
img2= img;
axes(handles.axes1);
imshow(img);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img2
axes(handles.axes1);
imshow(img2);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
imblack = img;
imblack = 1-img;
axes(handles.axes1);
imshow(imblack);




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
imgray =( img(:, :, 1)+img(:, :, 2)+img(:, :, 2))/3;
axes(handles.axes1);
imshow(imgray);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global img2
val = 0.5*get(hObject, 'Value')-0.5;
imbright = img2+val;
axes(handles.axes1);
imshow(imbright);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
