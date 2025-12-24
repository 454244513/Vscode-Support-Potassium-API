---@meta
---@diagnostic disable

-- ==================
-- Cache Functions
-- ==================

---Deletes object from the Instance cache. Effectively invalidates object as a reference to the underlying Instance.
---@param object Instance
---@return nil
function cache.invalidate(object) end

---Checks whether object exists in the Instance cache.
---@param object Instance
---@return boolean
function cache.iscached(object) end

---Replaces object in the Instance cache with newObject.
---@param object Instance
---@param newobject Instance
---@return nil
function cache.replace(object, newobject) end

---Returns a copy of the Instance reference to object. This is useful for managing an Instance without directly referencing it.
---@param object Instance
---@return Instance
function cloneref(object) end

---Returns whether objects a and b both reference the same Instance.
---@param a Instance
---@param b Instance
---@return boolean
function compareinstances(a, b) end

-- ==================
-- Closures Functions
-- ==================

---Returns whether the function currently running was called by the executor.
---@return boolean
function checkcaller() end

---Generates a new closure based on the bytecode of function func.
---@param func function
---@return function
function clonefunction(func) end

---Returns the script responsible for the currently running function.
---@return BaseScript
function getcallingscript() end

---Replaces func with hook internally, where hook will be invoked in place of func when called. Returns a new function that can be used to access the original definition of func.
---@param func function
---@param hook function
---@return function
function hookfunction(func, hook) end

---Returns whether or not func is a closure whose source is written in C.
---@param func function
---@return boolean
function iscclosure(func) end

---Returns whether or not func is a closure whose source is written in Luau.
---@param func function
---@return boolean
function islclosure(func) end

---Returns whether or not func was created by the executor.
---@param func function
---@return boolean
function isexecutorclosure(func) end

---Generates a chunk from the given source code. The environment of the returned function is the global environment.
---@param source string
---@param chunkname? string
---@return function|nil
---@return string|nil
function loadstring(source, chunkname) end

---Returns a C closure that wraps func. The result is functionally identical to func, but identifies as a C closure.
---@param func function
---@return function
function newcclosure(func) end

-- ==================
-- Console Functions
-- ==================

---Clears the output of the console window.
---@return nil
function rconsoleclear() end

---Opens the console window. (Disabled)
---@return nil
function rconsolecreate() end

---Clears the output of the console window.
---@return nil
function rconsoledestroy() end

---Waits for the user to input text into the console window. Returns the result. (Disabled)
---@return string
function rconsoleinput() end

---Prints text to the console window. Does not clear existing text or create a new line.
---@param text string
---@return nil
function rconsoleprint(text) end

---Prints text as a warning to the console window.
---@param text string
---@return nil
function rconsolewarn(text) end

---Prints text as an error to the console window.
---@param text string
---@return nil
function rconsoleerror(text) end

---Sets the title of the console window to title. (Disabled)
---@param title string
---@return nil
function rconsolesettitle(title) end

-- ==================
-- Crypt Functions
-- ==================

---@class crypt
crypt = {}

---Encodes a string of bytes into Base64.
---@param data string
---@return string
function crypt.base64encode(data) end

---Decodes a Base64 string to a string of bytes.
---@param data string
---@return string
function crypt.base64decode(data) end

---Encrypts an unencoded string using AES encryption. Returns the base64 encoded and encrypted string, and the IV.
---@param data string
---@param key string
---@param iv? string
---@param mode? string
---@return string
---@return string
function crypt.encrypt(data, key, iv, mode) end

---Decrypts the base64 encoded and encrypted content. Returns the raw string.
---@param data string
---@param key string
---@param iv string
---@param mode string
---@return string
function crypt.decrypt(data, key, iv, mode) end

---Generates a random sequence of bytes of the given size. Returns the sequence as a base64 encoded string.
---@param size number
---@return string
function crypt.generatebytes(size) end

---Generates a base64 encoded 256-bit key.
---@return string
function crypt.generatekey() end

---Returns the result of hashing the data using the given algorithm.
---@param data string
---@param algo string
---@return string
function crypt.hash(data, algo) end


-- ==================
-- Debug Functions
-- ==================

---@class debug
debug = {}

---Returns whether level is a valid level or not.
---@param level number
---@return boolean
function debug.isvalidlevel(level) end

---Returns the lua registry.
---@return table
function debug.getregistry() end

---Returns the constant at index in the constant table of the function or level func.
---@param func function|number
---@param index number
---@return any
function debug.getconstant(func, index) end

---Returns the constant table of the function or level func.
---@param func function|number
---@return table
function debug.getconstants(func) end

---@class DebugInfo
---@field source string The name of the chunk that created the function.
---@field short_src string A "printable" version of source to be used in error messages.
---@field func function The function itself.
---@field what string The string "Lua" if the function is a Luau function, or "C" if it is a C function.
---@field currentline number The current line where the given function is executing.
---@field name string The name of the function.
---@field nups number The number of upvalues in the function.
---@field numparams number The number of parameters in the function.
---@field is_vararg number Whether the function has a variadic argument.

---Returns debugger information about a function or stack level.
---@param func function|number
---@return DebugInfo
function debug.getinfo(func) end

---Returns the proto at index in the function or level func.
---@param func function|number
---@param index number
---@param active? boolean
---@return function|table
function debug.getproto(func, index, active) end

---Returns a list of protos of the function or level func.
---@param func function|number
---@return table
function debug.getprotos(func) end

---Returns the value at index in the stack frame level.
---@param func function|number
---@param index? number
---@return any|table
function debug.getstack(func, index) end

---Returns the upvalue at index in the function or level func.
---@param func function|number
---@param index number
---@return any
function debug.getupvalue(func, index) end

---Returns a list of upvalues of the function or level func.
---@param func function|number
---@return table
function debug.getupvalues(func) end

---Sets the constant at index in the function or level func to value.
---@param func function|number
---@param index number
---@param value any
---@return nil
function debug.setconstant(func, index, value) end

---Sets the register at index in the stack frame level to value.
---@param func function|number
---@param index number
---@param value any
---@return nil
function debug.setstack(func, index, value) end

---Sets the upvalue at index in the function or level func to value.
---@param func function|number
---@param index number
---@param value any
---@return nil
function debug.setupvalue(func, index, value) end

-- Global aliases for debug functions
---@param func function|number
---@param index number
---@return any
function getconstant(func, index) end

---@param func function|number
---@return table
function getconstants(func) end

---@param func function|number
---@return DebugInfo
function getinfo(func) end

---@param func function|number
---@param index number
---@param active? boolean
---@return function|table
function getproto(func, index, active) end

---@param func function|number
---@return table
function getprotos(func) end

---@param func function|number
---@param index? number
---@return any|table
function getstack(func, index) end

---@param func function|number
---@param index number
---@return any
function getupvalue(func, index) end

---@param func function|number
---@return table
function getupvalues(func) end

---@param func function|number
---@param index number
---@param value any
---@return nil
function setconstant(func, index, value) end

---@param func function|number
---@param index number
---@param value any
---@return nil
function setstack(func, index, value) end

---@param func function|number
---@param index number
---@param value any
---@return nil
function setupvalue(func, index, value) end

-- ==================
-- Drawing Functions
-- ==================

---@class BaseDrawingObject
---@field Visible boolean
---@field ZIndex number
---@field Transparency number
---@field Color Color3
---@field Destroy function

---@class DrawingLine: BaseDrawingObject
---@field From Vector2
---@field To Vector2
---@field Thickness number

---@class DrawingText: BaseDrawingObject
---@field Text string
---@field TextBounds Vector2
---@field Font number
---@field Size number
---@field Position Vector2
---@field Center boolean
---@field Outline boolean
---@field OutlineColor Color3

---@class DrawingImage: BaseDrawingObject
---@field Data string
---@field Size Vector2
---@field Position Vector2
---@field Rounding number

---@class DrawingCircle: BaseDrawingObject
---@field NumSides number
---@field Radius number
---@field Position Vector2
---@field Thickness number
---@field Filled boolean

---@class DrawingSquare: BaseDrawingObject
---@field Size Vector2
---@field Position Vector2
---@field Thickness number
---@field Filled boolean

---@class DrawingQuad: BaseDrawingObject
---@field PointA Vector2
---@field PointB Vector2
---@field PointC Vector2
---@field PointD Vector2
---@field Thickness number
---@field Filled boolean

---@class DrawingTriangle: BaseDrawingObject
---@field PointA Vector2
---@field PointB Vector2
---@field PointC Vector2
---@field Thickness number
---@field Filled boolean

---@alias DrawingObject DrawingLine|DrawingText|DrawingImage|DrawingCircle|DrawingSquare|DrawingQuad|DrawingTriangle

---@class Drawing
---@field Fonts table<string, number>
Drawing = {}

---@type table<string, number>
Drawing.Fonts = {
    UI = 0,
    System = 1,
    Plex = 2,
    Monospace = 3
}

---Create a new drawing object of the specified type.
---@param type "Line"|"Text"|"Image"|"Circle"|"Square"|"Quad"|"Triangle"
---@return DrawingObject
function Drawing.new(type) end

---Destroys every drawing object in the cache.
---@return nil
function cleardrawcache() end

---Gets the value of a property of a drawing.
---@param drawing DrawingObject
---@param property string
---@return any
function getrenderproperty(drawing, property) end

---Returns whether the given object is a valid Drawing.
---@param object any
---@return boolean
function isrenderobj(object) end

---Sets the value of a property of a drawing.
---@param drawing DrawingObject
---@param property string
---@param value any
---@return nil
function setrenderproperty(drawing, property, value) end


-- ==================
-- File System Functions
-- ==================

---Returns the contents of the file located at path.
---@param path string
---@return string
function readfile(path) end

---Returns a list of files and folders in the folder located at path.
---@param path string
---@return table<string>
function listfiles(path) end

---Writes data to the file located at path if it is not a folder.
---@param path string
---@param data string
---@return nil
function writefile(path, data) end

---Creates a folder at path if it does not already exist.
---@param path string
---@return nil
function makefolder(path) end

---Appends data to the end of the file located at path.
---@param path string
---@param data string
---@return nil
function appendfile(path, data) end

---Returns whether or not path points to a file.
---@param path string
---@return boolean
function isfile(path) end

---Returns whether or not path points to a folder.
---@param path string
---@return boolean
function isfolder(path) end

---Removes the file located at path.
---@param path string
---@return nil
function delfile(path) end

---Removes the folder located at path.
---@param path string
---@return nil
function delfolder(path) end

---Generates a chunk from the file located at path.
---@param path string
---@param chunkname? string
---@return function|nil
---@return string|nil
function loadfile(path, chunkname) end

---Attempts to load the file located at path and execute it on a new thread.
---@param path string
---@return nil
function dofile(path) end

-- ==================
-- Input Functions
-- ==================

---Returns whether the game's window is in focus.
---@return boolean
function isrbxactive() end

---Dispatches a left mouse button click.
---@return nil
function mouse1click() end

---Dispatches a left mouse button press.
---@return nil
function mouse1press() end

---Dispatches a left mouse button release.
---@return nil
function mouse1release() end

---Dispatches a right mouse button click.
---@return nil
function mouse2click() end

---Dispatches a right mouse button press.
---@return nil
function mouse2press() end

---Dispatches a right mouse button release.
---@return nil
function mouse2release() end

---Moves the mouse cursor to the specified absolute position.
---@param x number
---@param y number
---@return nil
function mousemoveabs(x, y) end

---Adjusts the mouse cursor by the specified relative amount.
---@param x number
---@param y number
---@return nil
function mousemoverel(x, y) end

---Dispatches a mouse scroll by the specified number of pixels.
---@param pixels number
---@return nil
function mousescroll(pixels) end

-- ==================
-- Instance Functions
-- ==================

---Dispatches a click or hover event to the given ClickDetector.
---@param object ClickDetector
---@param distance? number
---@return nil
function fireclickdetector(object, distance) end

---Simulates a touch event between two parts.
---@param instance Instance
---@param touchingPart Instance
---@param isTouching boolean
---@return nil
function firetouchinterest(instance, touchingPart, isTouching) end

---Returns true if the Part is owned by the player.
---@param part Instance
---@return boolean
function isnetworkowner(part) end

---Returns the function assigned to a callback property of object.
---@param object Instance
---@param property string
---@return function|nil
function getcallbackvalue(object, property) end

---Fires the trigger of prompt.
---@param prompt ProximityPrompt
---@return nil
function fireproximityprompt(prompt) end

---@class ConnectionObject
---@field Enabled boolean Whether the connection can receive events.
---@field ForeignState boolean Whether the function was connected by a foreign Luau state.
---@field LuaConnection boolean Whether the connection was created in Luau code.
---@field Function function|nil The function bound to this connection.
---@field Thread thread|nil The thread that created the connection.
---@field Fire fun(...: any) Fires this connection with the provided arguments.
---@field Defer fun(...: any) Defers an event to connection with the provided arguments.
---@field Disconnect fun() Disconnects the connection.
---@field Disable fun() Prevents the connection from firing.
---@field Enable fun() Allows the connection to fire if it was previously disabled.

---Creates a list of Connection objects for the functions connected to signal.
---@param signal RBXScriptSignal
---@return table<ConnectionObject>
function getconnections(signal) end

---Returns a Connection object for index.
---@param signal RBXScriptSignal
---@param index number
---@return ConnectionObject
function getconnection(signal, index) end

---Fires all Lua connections of signal.
---@param signal RBXScriptSignal
---@param ... any
---@return nil
function firesignal(signal, ...) end

---Returns a rbxasset:// content id for the asset located at path.
---@param path string
---@return string
function getcustomasset(path) end

---Returns the value of a hidden property of object.
---@param object Instance
---@param property string
---@return any
---@return boolean
function gethiddenproperty(object, property) end

---Sets the player's simulationRadius.
---@param simulationRadius number
---@param maxSimulationRadius? number
---@return nil
function setsimulationradius(simulationRadius, maxSimulationRadius) end

---Returns a hidden GUI container.
---@return Folder
function gethui() end

---Returns a list of every Instance referenced on the client.
---@return table<Instance>
function getinstances() end

---Returns a list of Instances that are not descendants of a service provider.
---@return table<Instance>
function getnilinstances() end

---Returns whether the given property is scriptable.
---@param object Instance
---@param property string
---@return boolean|nil
function isscriptable(object, property) end

---Sets the value of a hidden property of object.
---@param object Instance
---@param property string
---@param value any
---@return boolean
function sethiddenproperty(object, property, value) end

---Sets the Studio client's clipboard to the given rbxm or rbxmx model data.
---@param data string
---@return boolean
function setrbxclipboard(data) end

---Set whether the given property is scriptable.
---@param object Instance
---@param property string
---@param value boolean
---@return boolean
function setscriptable(object, property, value) end

---Returns all callbacks bound with RunService.BindToRenderStep.
---@return table
function getrendersteppedlist() end

---Replicates signal on the server.
---@param signal RBXScriptSignal
---@param ... any
---@return nil
function replicatesignal(signal, ...) end


-- ==================
-- Metatable Functions
-- ==================

---Returns the metatable of object, where the __metatable field would normally lock the metatable.
---@param object table
---@return table
function getrawmetatable(object) end

---Replaces func with hook internally, where hook will be invoked in place of func when called.
---@param object table
---@param method string
---@param hook function
---@return function
function hookmetamethod(object, method, hook) end

---Returns the name of the method that invoked the __namecall metamethod.
---@return string
function getnamecallmethod() end

---Changes the name of the method that invoked __namecall metamethod.
---@param method string
---@return nil
function setnamecallmethod(method) end

---Returns whether object is read-only or not.
---@param object table
---@return boolean
function isreadonly(object) end

---Sets the metatable of object to metatable.
---@param object table
---@param metatable table
---@return nil
function setrawmetatable(object, metatable) end

---Sets whether object is read-only or not.
---@param object table
---@param readonly boolean
---@return nil
function setreadonly(object, readonly) end

---Unfreezes object.
---@param object table
---@return nil
function makewriteable(object) end

---Freezes object.
---@param object table
---@return nil
function makereadonly(object) end

-- ==================
-- Miscellaneous Functions
-- ==================

---Returns the name and version of Potassium.
---@return string
---@return string
function identifyexecutor() end

---Compresses data using LZ4 compression.
---@param data string
---@return string
function lz4compress(data) end

---Decompresses data using LZ4 compression.
---@param data string
---@param size number
---@return string
function lz4decompress(data, size) end

---Creates a message box with the specified text, caption, and flags.
---@param text string
---@param caption string
---@param flags number
---@return number
function messagebox(text, caption, flags) end

---Queues the specified script to be executed after the player teleports.
---@param code string
---@return nil
function queue_on_teleport(code) end

---@class HttpRequest
---@field Url string The URL for the request.
---@field Method string The HTTP method to use.
---@field Body? string The body of the request.
---@field Headers? table A table of headers.
---@field Cookies? table A table of cookies.

---@class HttpResponse
---@field Success boolean
---@field StatusCode number
---@field StatusMessage string
---@field Headers table
---@field Body string

---Sends an HTTP request using the specified options.
---@param options HttpRequest
---@return HttpResponse
function request(options) end

---Returns the internal parent field of the instance.
---@param instance Instance
---@return Instance
function getinternalparent(instance) end

---Returns the value of fflag.
---@param fflag string
---@return any
function getfflag(fflag) end

---Sets the value of fflag to value.
---@param fflag string
---@param value any
---@return nil
function setfflag(fflag, value) end

---Sets the internal parent field of instance to newparent.
---@param instance Instance
---@param newparent Instance
---@return nil
function setinternalparent(instance, newparent) end

---Copies text to the clipboard.
---@param text string
---@return nil
function setclipboard(text) end

---Sets the in-game FPS cap to fps. If fps is 0, the FPS cap is disabled.
---@param fps number
---@return nil
function setfpscap(fps) end

-- ==================
-- Scripts Functions
-- ==================

---Returns a list of objects in the Luau garbage collector.
---@param includetables? boolean
---@return table<function|userdata|table>
function getgc(includetables) end

---Returns the custom global environment of the executor.
---@return table
function getgenv() end

---Returns the environment of thread.
---@param thread thread
---@return table
function gettenv(thread) end

---Returns the lua registry.
---@return table
function getreg() end

---Returns a list of ModuleScripts that have been loaded.
---@return table<ModuleScript>
function getloadedmodules() end

---Returns the global environment of the game client.
---@return table
function getrenv() end

---Returns a list of scripts that are currently running.
---@return table<LocalScript|ModuleScript>
function getrunningscripts() end

---Returns the raw Luau bytecode of the given script.
---@param script LocalScript|ModuleScript
---@return string
function getscriptbytecode(script) end

---Generates a new closure using the bytecode of script.
---@param script LocalScript|ModuleScript
---@return function
function getscriptclosure(script) end

---Returns a SHA384 hash of the script's bytecode.
---@param script LocalScript|ModuleScript
---@return string
function getscripthash(script) end

---Returns a list of every script in the game.
---@return table<LocalScript|ModuleScript>
function getscripts() end

---Returns the global environment of the given script.
---@param script LocalScript|ModuleScript
---@return table
function getsenv(script) end

---Returns the identity of the current thread.
---@return number
function getthreadidentity() end

---Sets the current thread identity.
---@param identity number
---@return nil
function setthreadidentity(identity) end

-- ==================
-- WebSocket Functions
-- ==================

---@class WebSocketConnection
---@field Send fun(message: string) Sends a message over the WebSocket connection.
---@field Close fun() Closes the WebSocket connection.
---@field OnMessage RBXScriptSignal Fired when a message is received.
---@field OnClose RBXScriptSignal Fired when the WebSocket connection is closed.

---@class WebSocket
WebSocket = {}

---Establishes a WebSocket connection to the specified URL.
---@param url string
---@return WebSocketConnection
function WebSocket.connect(url) end

-- ==================
-- Actor Functions
-- ==================

---Returns the channel and the associated ID.
---@return number
---@return BindableEvent
function create_comm_channel() end

---Returns the communication channel if it exists.
---@param id number
---@return BindableEvent
function get_comm_channel(id) end

---Runs a script on an actor thread.
---@param actor Actor
---@param script string
---@param ... any
---@return nil
function run_on_actor(actor, script, ...) end

---Returns a table of all actors that exist within the game.
---@return table<Actor>
function getactors() end

---Returns if the thread is running on an actor.
---@return boolean
function is_parallel() end

---Runs a script on a specified thread, actor threads only.
---@param thread thread
---@param script string
---@param ... any
---@return nil
function run_on_thread(thread, script, ...) end

---Returns all threads that belong to actors in a table.
---@return table<thread>
function getactorthreads() end
