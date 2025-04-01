var EmulatorModule = (() => {
    var _scriptDir =
        typeof document !== "undefined" && document.currentScript
            ? document.currentScript.src
            : undefined;

    return function (EmulatorModule) {
        EmulatorModule = EmulatorModule || {};

        var Module = typeof EmulatorModule != "undefined" ? EmulatorModule : {};
        var readyPromiseResolve, readyPromiseReject;
        Module["ready"] = new Promise(function (resolve, reject) {
            readyPromiseResolve = resolve;
            readyPromiseReject = reject;
        });
        var moduleOverrides = Object.assign({}, Module);
        var arguments_ = [];
        var thisProgram = "./this.program";
        var quit_ = (status, toThrow) => {
            throw toThrow;
        };
        var ENVIRONMENT_IS_WEB = true;
        var ENVIRONMENT_IS_WORKER = false;
        var scriptDirectory = "";
        function locateFile(path) {
            if (Module["locateFile"]) {
                return Module["locateFile"](path, scriptDirectory);
            }
            return scriptDirectory + path;
        }
        var read_, readAsync, readBinary, setWindowTitle;
        if (ENVIRONMENT_IS_WEB || ENVIRONMENT_IS_WORKER) {
            if (ENVIRONMENT_IS_WORKER) {
                scriptDirectory = self.location.href;
            } else if (
                typeof document != "undefined" &&
                document.currentScript
            ) {
                scriptDirectory = document.currentScript.src;
            }
            if (_scriptDir) {
                scriptDirectory = _scriptDir;
            }
            if (scriptDirectory.indexOf("blob:") !== 0) {
                scriptDirectory = scriptDirectory.substr(
                    0,
                    scriptDirectory.replace(/[?#].*/, "").lastIndexOf("/") + 1,
                );
            } else {
                scriptDirectory = "";
            }
            {
                read_ = (url) => {
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", url, false);
                    xhr.send(null);
                    return xhr.responseText;
                };
                if (ENVIRONMENT_IS_WORKER) {
                    readBinary = (url) => {
                        var xhr = new XMLHttpRequest();
                        xhr.open("GET", url, false);
                        xhr.responseType = "arraybuffer";
                        xhr.send(null);
                        return new Uint8Array(xhr.response);
                    };
                }
                readAsync = (url, onload, onerror) => {
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", url, true);
                    xhr.responseType = "arraybuffer";
                    xhr.onload = () => {
                        if (
                            xhr.status == 200 ||
                            (xhr.status == 0 && xhr.response)
                        ) {
                            onload(xhr.response);
                            return;
                        }
                        onerror();
                    };
                    xhr.onerror = onerror;
                    xhr.send(null);
                };
            }
            setWindowTitle = (title) => (document.title = title);
        } else {
        }
        var out = Module["print"] || console.log.bind(console);
        var err = Module["printErr"] || console.warn.bind(console);
        Object.assign(Module, moduleOverrides);
        moduleOverrides = null;
        if (Module["arguments"]) arguments_ = Module["arguments"];
        if (Module["thisProgram"]) thisProgram = Module["thisProgram"];
        if (Module["quit"]) quit_ = Module["quit"];
        var wasmBinary;
        if (Module["wasmBinary"]) wasmBinary = Module["wasmBinary"];
        var noExitRuntime = Module["noExitRuntime"] || true;
        if (typeof WebAssembly != "object") {
            abort("no native wasm support detected");
        }
        var wasmMemory;
        var ABORT = false;
        var EXITSTATUS;
        var UTF8Decoder =
            typeof TextDecoder != "undefined"
                ? new TextDecoder("utf8")
                : undefined;
        function UTF8ArrayToString(heapOrArray, idx, maxBytesToRead) {
            var endIdx = idx + maxBytesToRead;
            var endPtr = idx;
            while (heapOrArray[endPtr] && !(endPtr >= endIdx)) ++endPtr;
            if (endPtr - idx > 16 && heapOrArray.buffer && UTF8Decoder) {
                return UTF8Decoder.decode(heapOrArray.subarray(idx, endPtr));
            }
            var str = "";
            while (idx < endPtr) {
                var u0 = heapOrArray[idx++];
                if (!(u0 & 128)) {
                    str += String.fromCharCode(u0);
                    continue;
                }
                var u1 = heapOrArray[idx++] & 63;
                if ((u0 & 224) == 192) {
                    str += String.fromCharCode(((u0 & 31) << 6) | u1);
                    continue;
                }
                var u2 = heapOrArray[idx++] & 63;
                if ((u0 & 240) == 224) {
                    u0 = ((u0 & 15) << 12) | (u1 << 6) | u2;
                } else {
                    u0 =
                        ((u0 & 7) << 18) |
                        (u1 << 12) |
                        (u2 << 6) |
                        (heapOrArray[idx++] & 63);
                }
                if (u0 < 65536) {
                    str += String.fromCharCode(u0);
                } else {
                    var ch = u0 - 65536;
                    str += String.fromCharCode(
                        55296 | (ch >> 10),
                        56320 | (ch & 1023),
                    );
                }
            }
            return str;
        }
        function UTF8ToString(ptr, maxBytesToRead) {
            return ptr ? UTF8ArrayToString(HEAPU8, ptr, maxBytesToRead) : "";
        }
        function stringToUTF8Array(str, heap, outIdx, maxBytesToWrite) {
            if (!(maxBytesToWrite > 0)) return 0;
            var startIdx = outIdx;
            var endIdx = outIdx + maxBytesToWrite - 1;
            for (var i = 0; i < str.length; ++i) {
                var u = str.charCodeAt(i);
                if (u >= 55296 && u <= 57343) {
                    var u1 = str.charCodeAt(++i);
                    u = (65536 + ((u & 1023) << 10)) | (u1 & 1023);
                }
                if (u <= 127) {
                    if (outIdx >= endIdx) break;
                    heap[outIdx++] = u;
                } else if (u <= 2047) {
                    if (outIdx + 1 >= endIdx) break;
                    heap[outIdx++] = 192 | (u >> 6);
                    heap[outIdx++] = 128 | (u & 63);
                } else if (u <= 65535) {
                    if (outIdx + 2 >= endIdx) break;
                    heap[outIdx++] = 224 | (u >> 12);
                    heap[outIdx++] = 128 | ((u >> 6) & 63);
                    heap[outIdx++] = 128 | (u & 63);
                } else {
                    if (outIdx + 3 >= endIdx) break;
                    heap[outIdx++] = 240 | (u >> 18);
                    heap[outIdx++] = 128 | ((u >> 12) & 63);
                    heap[outIdx++] = 128 | ((u >> 6) & 63);
                    heap[outIdx++] = 128 | (u & 63);
                }
            }
            heap[outIdx] = 0;
            return outIdx - startIdx;
        }
        function stringToUTF8(str, outPtr, maxBytesToWrite) {
            return stringToUTF8Array(str, HEAPU8, outPtr, maxBytesToWrite);
        }
        function lengthBytesUTF8(str) {
            var len = 0;
            for (var i = 0; i < str.length; ++i) {
                var c = str.charCodeAt(i);
                if (c <= 127) {
                    len++;
                } else if (c <= 2047) {
                    len += 2;
                } else if (c >= 55296 && c <= 57343) {
                    len += 4;
                    ++i;
                } else {
                    len += 3;
                }
            }
            return len;
        }
        var buffer,
            HEAP8,
            HEAPU8,
            HEAP16,
            HEAPU16,
            HEAP32,
            HEAPU32,
            HEAPF32,
            HEAPF64;
        function updateGlobalBufferAndViews(buf) {
            buffer = buf;
            Module["HEAP8"] = HEAP8 = new Int8Array(buf);
            Module["HEAP16"] = HEAP16 = new Int16Array(buf);
            Module["HEAP32"] = HEAP32 = new Int32Array(buf);
            Module["HEAPU8"] = HEAPU8 = new Uint8Array(buf);
            Module["HEAPU16"] = HEAPU16 = new Uint16Array(buf);
            Module["HEAPU32"] = HEAPU32 = new Uint32Array(buf);
            Module["HEAPF32"] = HEAPF32 = new Float32Array(buf);
            Module["HEAPF64"] = HEAPF64 = new Float64Array(buf);
        }
        var INITIAL_MEMORY = Module["INITIAL_MEMORY"] || 16777216;
        var wasmTable;
        var __ATPRERUN__ = [];
        var __ATINIT__ = [];
        var __ATPOSTRUN__ = [];
        var runtimeInitialized = false;
        function preRun() {
            if (Module["preRun"]) {
                if (typeof Module["preRun"] == "function")
                    Module["preRun"] = [Module["preRun"]];
                while (Module["preRun"].length) {
                    addOnPreRun(Module["preRun"].shift());
                }
            }
            callRuntimeCallbacks(__ATPRERUN__);
        }
        function initRuntime() {
            runtimeInitialized = true;
            callRuntimeCallbacks(__ATINIT__);
        }
        function postRun() {
            if (Module["postRun"]) {
                if (typeof Module["postRun"] == "function")
                    Module["postRun"] = [Module["postRun"]];
                while (Module["postRun"].length) {
                    addOnPostRun(Module["postRun"].shift());
                }
            }
            callRuntimeCallbacks(__ATPOSTRUN__);
        }
        function addOnPreRun(cb) {
            __ATPRERUN__.unshift(cb);
        }
        function addOnInit(cb) {
            __ATINIT__.unshift(cb);
        }
        function addOnPostRun(cb) {
            __ATPOSTRUN__.unshift(cb);
        }
        var runDependencies = 0;
        var runDependencyWatcher = null;
        var dependenciesFulfilled = null;
        function addRunDependency(id) {
            runDependencies++;
            if (Module["monitorRunDependencies"]) {
                Module["monitorRunDependencies"](runDependencies);
            }
        }
        function removeRunDependency(id) {
            runDependencies--;
            if (Module["monitorRunDependencies"]) {
                Module["monitorRunDependencies"](runDependencies);
            }
            if (runDependencies == 0) {
                if (runDependencyWatcher !== null) {
                    clearInterval(runDependencyWatcher);
                    runDependencyWatcher = null;
                }
                if (dependenciesFulfilled) {
                    var callback = dependenciesFulfilled;
                    dependenciesFulfilled = null;
                    callback();
                }
            }
        }
        function abort(what) {
            {
                if (Module["onAbort"]) {
                    Module["onAbort"](what);
                }
            }
            what = "Aborted(" + what + ")";
            err(what);
            ABORT = true;
            EXITSTATUS = 1;
            what += ". Build with -sASSERTIONS for more info.";
            var e = new WebAssembly.RuntimeError(what);
            readyPromiseReject(e);
            throw e;
        }
        var dataURIPrefix = "data:application/octet-stream;base64,";
        function isDataURI(filename) {
            return filename.startsWith(dataURIPrefix);
        }
        var wasmBinaryFile;
        wasmBinaryFile = "emulator-emscripten.wasm";
        if (!isDataURI(wasmBinaryFile)) {
            wasmBinaryFile = locateFile(wasmBinaryFile);
        }
        function getBinary(file) {
            try {
                if (file == wasmBinaryFile && wasmBinary) {
                    return new Uint8Array(wasmBinary);
                }
                if (readBinary) {
                    return readBinary(file);
                }
                throw "both async and sync fetching of the wasm failed";
            } catch (err) {
                abort(err);
            }
        }
        function getBinaryPromise() {
            if (!wasmBinary && (ENVIRONMENT_IS_WEB || ENVIRONMENT_IS_WORKER)) {
                if (typeof fetch == "function") {
                    return fetch(wasmBinaryFile, { credentials: "same-origin" })
                        .then(function (response) {
                            if (!response["ok"]) {
                                throw (
                                    "failed to load wasm binary file at '" +
                                    wasmBinaryFile +
                                    "'"
                                );
                            }
                            return response["arrayBuffer"]();
                        })
                        .catch(function () {
                            return getBinary(wasmBinaryFile);
                        });
                }
            }
            return Promise.resolve().then(function () {
                return getBinary(wasmBinaryFile);
            });
        }
        function createWasm() {
            var info = { a: asmLibraryArg };
            function receiveInstance(instance, module) {
                var exports = instance.exports;
                Module["asm"] = exports;
                wasmMemory = Module["asm"]["Ja"];
                updateGlobalBufferAndViews(wasmMemory.buffer);
                wasmTable = Module["asm"]["Sa"];
                addOnInit(Module["asm"]["Ka"]);
                removeRunDependency("wasm-instantiate");
            }
            addRunDependency("wasm-instantiate");
            function receiveInstantiationResult(result) {
                receiveInstance(result["instance"]);
            }
            function instantiateArrayBuffer(receiver) {
                return getBinaryPromise()
                    .then(function (binary) {
                        return WebAssembly.instantiate(binary, info);
                    })
                    .then(function (instance) {
                        return instance;
                    })
                    .then(receiver, function (reason) {
                        err("failed to asynchronously prepare wasm: " + reason);
                        abort(reason);
                    });
            }
            function instantiateAsync() {
                if (
                    !wasmBinary &&
                    typeof WebAssembly.instantiateStreaming == "function" &&
                    !isDataURI(wasmBinaryFile) &&
                    typeof fetch == "function"
                ) {
                    return fetch(wasmBinaryFile, {
                        credentials: "same-origin",
                    }).then(function (response) {
                        var result = WebAssembly.instantiateStreaming(
                            response,
                            info,
                        );
                        return result.then(
                            receiveInstantiationResult,
                            function (reason) {
                                err("wasm streaming compile failed: " + reason);
                                err(
                                    "falling back to ArrayBuffer instantiation",
                                );
                                return instantiateArrayBuffer(
                                    receiveInstantiationResult,
                                );
                            },
                        );
                    });
                } else {
                    return instantiateArrayBuffer(receiveInstantiationResult);
                }
            }
            if (Module["instantiateWasm"]) {
                try {
                    var exports = Module["instantiateWasm"](
                        info,
                        receiveInstance,
                    );
                    return exports;
                } catch (e) {
                    err(
                        "Module.instantiateWasm callback failed with error: " +
                            e,
                    );
                    return false;
                }
            }
            instantiateAsync().catch(readyPromiseReject);
            return {};
        }
        var ASM_CONSTS = {
            1828456: () => {
                return Module.getRandomValue();
            },
            1828492: () => {
                if (Module.getRandomValue === undefined) {
                    try {
                        var window_ =
                            "object" === typeof window ? window : self;
                        var crypto_ =
                            typeof window_.crypto !== "undefined"
                                ? window_.crypto
                                : window_.msCrypto;
                        var randomValuesStandard = function () {
                            var buf = new Uint32Array(1);
                            crypto_.getRandomValues(buf);
                            return buf[0] >>> 0;
                        };
                        randomValuesStandard();
                        Module.getRandomValue = randomValuesStandard;
                    } catch (e) {
                        try {
                            var crypto = require("crypto");
                            var randomValueNodeJS = function () {
                                var buf = crypto["randomBytes"](4);
                                return (
                                    ((buf[0] << 24) |
                                        (buf[1] << 16) |
                                        (buf[2] << 8) |
                                        buf[3]) >>>
                                    0
                                );
                            };
                            randomValueNodeJS();
                            Module.getRandomValue = randomValueNodeJS;
                        } catch (e) {
                            throw "No secure random number generator found";
                        }
                    }
                }
            },
            1829214: ($0) => {
                throw UTF8ToString($0);
            },
        };
        function callRuntimeCallbacks(callbacks) {
            while (callbacks.length > 0) {
                callbacks.shift()(Module);
            }
        }
        function jsStackTrace() {
            var error = new Error();
            if (!error.stack) {
                try {
                    throw new Error();
                } catch (e) {
                    error = e;
                }
                if (!error.stack) {
                    return "(no stack trace available)";
                }
            }
            return error.stack.toString();
        }
        function writeArrayToMemory(array, buffer) {
            HEAP8.set(array, buffer);
        }
        function ___cxa_allocate_exception(size) {
            return _malloc(size + 24) + 24;
        }
        var exceptionCaught = [];
        function exception_addRef(info) {
            info.add_ref();
        }
        var uncaughtExceptionCount = 0;
        function ___cxa_begin_catch(ptr) {
            var info = new ExceptionInfo(ptr);
            if (!info.get_caught()) {
                info.set_caught(true);
                uncaughtExceptionCount--;
            }
            info.set_rethrown(false);
            exceptionCaught.push(info);
            exception_addRef(info);
            return info.get_exception_ptr();
        }
        var exceptionLast = 0;
        function ExceptionInfo(excPtr) {
            this.excPtr = excPtr;
            this.ptr = excPtr - 24;
            this.set_type = function (type) {
                HEAPU32[(this.ptr + 4) >> 2] = type;
            };
            this.get_type = function () {
                return HEAPU32[(this.ptr + 4) >> 2];
            };
            this.set_destructor = function (destructor) {
                HEAPU32[(this.ptr + 8) >> 2] = destructor;
            };
            this.get_destructor = function () {
                return HEAPU32[(this.ptr + 8) >> 2];
            };
            this.set_refcount = function (refcount) {
                HEAP32[this.ptr >> 2] = refcount;
            };
            this.set_caught = function (caught) {
                caught = caught ? 1 : 0;
                HEAP8[(this.ptr + 12) >> 0] = caught;
            };
            this.get_caught = function () {
                return HEAP8[(this.ptr + 12) >> 0] != 0;
            };
            this.set_rethrown = function (rethrown) {
                rethrown = rethrown ? 1 : 0;
                HEAP8[(this.ptr + 13) >> 0] = rethrown;
            };
            this.get_rethrown = function () {
                return HEAP8[(this.ptr + 13) >> 0] != 0;
            };
            this.init = function (type, destructor) {
                this.set_adjusted_ptr(0);
                this.set_type(type);
                this.set_destructor(destructor);
                this.set_refcount(0);
                this.set_caught(false);
                this.set_rethrown(false);
            };
            this.add_ref = function () {
                var value = HEAP32[this.ptr >> 2];
                HEAP32[this.ptr >> 2] = value + 1;
            };
            this.release_ref = function () {
                var prev = HEAP32[this.ptr >> 2];
                HEAP32[this.ptr >> 2] = prev - 1;
                return prev === 1;
            };
            this.set_adjusted_ptr = function (adjustedPtr) {
                HEAPU32[(this.ptr + 16) >> 2] = adjustedPtr;
            };
            this.get_adjusted_ptr = function () {
                return HEAPU32[(this.ptr + 16) >> 2];
            };
            this.get_exception_ptr = function () {
                var isPointer = ___cxa_is_pointer_type(this.get_type());
                if (isPointer) {
                    return HEAPU32[this.excPtr >> 2];
                }
                var adjusted = this.get_adjusted_ptr();
                if (adjusted !== 0) return adjusted;
                return this.excPtr;
            };
        }
        function ___cxa_free_exception(ptr) {
            return _free(new ExceptionInfo(ptr).ptr);
        }
        function getWasmTableEntry(funcPtr) {
            return wasmTable.get(funcPtr);
        }
        function exception_decRef(info) {
            if (info.release_ref() && !info.get_rethrown()) {
                var destructor = info.get_destructor();
                if (destructor) {
                    getWasmTableEntry(destructor)(info.excPtr);
                }
                ___cxa_free_exception(info.excPtr);
            }
        }
        function ___cxa_end_catch() {
            _setThrew(0);
            var info = exceptionCaught.pop();
            exception_decRef(info);
            exceptionLast = 0;
        }
        function ___resumeException(ptr) {
            if (!exceptionLast) {
                exceptionLast = ptr;
            }
            throw ptr;
        }
        function ___cxa_find_matching_catch_2() {
            var thrown = exceptionLast;
            if (!thrown) {
                setTempRet0(0);
                return 0;
            }
            var info = new ExceptionInfo(thrown);
            info.set_adjusted_ptr(thrown);
            var thrownType = info.get_type();
            if (!thrownType) {
                setTempRet0(0);
                return thrown;
            }
            var typeArray = Array.prototype.slice.call(arguments);
            for (var i = 0; i < typeArray.length; i++) {
                var caughtType = typeArray[i];
                if (caughtType === 0 || caughtType === thrownType) {
                    break;
                }
                var adjusted_ptr_addr = info.ptr + 16;
                if (
                    ___cxa_can_catch(caughtType, thrownType, adjusted_ptr_addr)
                ) {
                    setTempRet0(caughtType);
                    return thrown;
                }
            }
            setTempRet0(thrownType);
            return thrown;
        }
        function ___cxa_find_matching_catch_3() {
            var thrown = exceptionLast;
            if (!thrown) {
                setTempRet0(0);
                return 0;
            }
            var info = new ExceptionInfo(thrown);
            info.set_adjusted_ptr(thrown);
            var thrownType = info.get_type();
            if (!thrownType) {
                setTempRet0(0);
                return thrown;
            }
            var typeArray = Array.prototype.slice.call(arguments);
            for (var i = 0; i < typeArray.length; i++) {
                var caughtType = typeArray[i];
                if (caughtType === 0 || caughtType === thrownType) {
                    break;
                }
                var adjusted_ptr_addr = info.ptr + 16;
                if (
                    ___cxa_can_catch(caughtType, thrownType, adjusted_ptr_addr)
                ) {
                    setTempRet0(caughtType);
                    return thrown;
                }
            }
            setTempRet0(thrownType);
            return thrown;
        }
        function ___cxa_find_matching_catch_4() {
            var thrown = exceptionLast;
            if (!thrown) {
                setTempRet0(0);
                return 0;
            }
            var info = new ExceptionInfo(thrown);
            info.set_adjusted_ptr(thrown);
            var thrownType = info.get_type();
            if (!thrownType) {
                setTempRet0(0);
                return thrown;
            }
            var typeArray = Array.prototype.slice.call(arguments);
            for (var i = 0; i < typeArray.length; i++) {
                var caughtType = typeArray[i];
                if (caughtType === 0 || caughtType === thrownType) {
                    break;
                }
                var adjusted_ptr_addr = info.ptr + 16;
                if (
                    ___cxa_can_catch(caughtType, thrownType, adjusted_ptr_addr)
                ) {
                    setTempRet0(caughtType);
                    return thrown;
                }
            }
            setTempRet0(thrownType);
            return thrown;
        }
        function ___cxa_find_matching_catch_6() {
            var thrown = exceptionLast;
            if (!thrown) {
                setTempRet0(0);
                return 0;
            }
            var info = new ExceptionInfo(thrown);
            info.set_adjusted_ptr(thrown);
            var thrownType = info.get_type();
            if (!thrownType) {
                setTempRet0(0);
                return thrown;
            }
            var typeArray = Array.prototype.slice.call(arguments);
            for (var i = 0; i < typeArray.length; i++) {
                var caughtType = typeArray[i];
                if (caughtType === 0 || caughtType === thrownType) {
                    break;
                }
                var adjusted_ptr_addr = info.ptr + 16;
                if (
                    ___cxa_can_catch(caughtType, thrownType, adjusted_ptr_addr)
                ) {
                    setTempRet0(caughtType);
                    return thrown;
                }
            }
            setTempRet0(thrownType);
            return thrown;
        }
        function ___cxa_rethrow() {
            var info = exceptionCaught.pop();
            if (!info) {
                abort("no exception to throw");
            }
            var ptr = info.excPtr;
            if (!info.get_rethrown()) {
                exceptionCaught.push(info);
                info.set_rethrown(true);
                info.set_caught(false);
                uncaughtExceptionCount++;
            }
            exceptionLast = ptr;
            throw ptr;
        }
        function ___cxa_throw(ptr, type, destructor) {
            var info = new ExceptionInfo(ptr);
            info.init(type, destructor);
            exceptionLast = ptr;
            uncaughtExceptionCount++;
            throw ptr;
        }
        function ___cxa_uncaught_exceptions() {
            return uncaughtExceptionCount;
        }
        var SYSCALLS = {
            varargs: undefined,
            get: function () {
                SYSCALLS.varargs += 4;
                var ret = HEAP32[(SYSCALLS.varargs - 4) >> 2];
                return ret;
            },
            getStr: function (ptr) {
                var ret = UTF8ToString(ptr);
                return ret;
            },
        };
        function ___syscall_fcntl64(fd, cmd, varargs) {
            SYSCALLS.varargs = varargs;
            return 0;
        }
        function ___syscall_fstat64(fd, buf) {}
        function ___syscall_getdents64(fd, dirp, count) {}
        function ___syscall_ioctl(fd, op, varargs) {
            SYSCALLS.varargs = varargs;
            return 0;
        }
        function ___syscall_lstat64(path, buf) {}
        function ___syscall_newfstatat(dirfd, path, buf, flags) {}
        function ___syscall_openat(dirfd, path, flags, varargs) {
            SYSCALLS.varargs = varargs;
        }
        function ___syscall_stat64(path, buf) {}
        function __emscripten_date_now() {
            return Date.now();
        }
        var nowIsMonotonic = true;
        function __emscripten_get_now_is_monotonic() {
            return nowIsMonotonic;
        }
        function readI53FromI64(ptr) {
            return HEAPU32[ptr >> 2] + HEAP32[(ptr + 4) >> 2] * 4294967296;
        }
        function __gmtime_js(time, tmPtr) {
            var date = new Date(readI53FromI64(time) * 1e3);
            HEAP32[tmPtr >> 2] = date.getUTCSeconds();
            HEAP32[(tmPtr + 4) >> 2] = date.getUTCMinutes();
            HEAP32[(tmPtr + 8) >> 2] = date.getUTCHours();
            HEAP32[(tmPtr + 12) >> 2] = date.getUTCDate();
            HEAP32[(tmPtr + 16) >> 2] = date.getUTCMonth();
            HEAP32[(tmPtr + 20) >> 2] = date.getUTCFullYear() - 1900;
            HEAP32[(tmPtr + 24) >> 2] = date.getUTCDay();
            var start = Date.UTC(date.getUTCFullYear(), 0, 1, 0, 0, 0, 0);
            var yday = ((date.getTime() - start) / (1e3 * 60 * 60 * 24)) | 0;
            HEAP32[(tmPtr + 28) >> 2] = yday;
        }
        function __localtime_js(time, tmPtr) {
            var date = new Date(readI53FromI64(time) * 1e3);
            HEAP32[tmPtr >> 2] = date.getSeconds();
            HEAP32[(tmPtr + 4) >> 2] = date.getMinutes();
            HEAP32[(tmPtr + 8) >> 2] = date.getHours();
            HEAP32[(tmPtr + 12) >> 2] = date.getDate();
            HEAP32[(tmPtr + 16) >> 2] = date.getMonth();
            HEAP32[(tmPtr + 20) >> 2] = date.getFullYear() - 1900;
            HEAP32[(tmPtr + 24) >> 2] = date.getDay();
            var start = new Date(date.getFullYear(), 0, 1);
            var yday =
                ((date.getTime() - start.getTime()) / (1e3 * 60 * 60 * 24)) | 0;
            HEAP32[(tmPtr + 28) >> 2] = yday;
            HEAP32[(tmPtr + 36) >> 2] = -(date.getTimezoneOffset() * 60);
            var summerOffset = new Date(
                date.getFullYear(),
                6,
                1,
            ).getTimezoneOffset();
            var winterOffset = start.getTimezoneOffset();
            var dst =
                (summerOffset != winterOffset &&
                    date.getTimezoneOffset() ==
                        Math.min(winterOffset, summerOffset)) | 0;
            HEAP32[(tmPtr + 32) >> 2] = dst;
        }
        function __munmap_js(addr, len, prot, flags, fd, offset) {}
        function allocateUTF8(str) {
            var size = lengthBytesUTF8(str) + 1;
            var ret = _malloc(size);
            if (ret) stringToUTF8Array(str, HEAP8, ret, size);
            return ret;
        }
        function _tzset_impl(timezone, daylight, tzname) {
            var currentYear = new Date().getFullYear();
            var winter = new Date(currentYear, 0, 1);
            var summer = new Date(currentYear, 6, 1);
            var winterOffset = winter.getTimezoneOffset();
            var summerOffset = summer.getTimezoneOffset();
            var stdTimezoneOffset = Math.max(winterOffset, summerOffset);
            HEAP32[timezone >> 2] = stdTimezoneOffset * 60;
            HEAP32[daylight >> 2] = Number(winterOffset != summerOffset);
            function extractZone(date) {
                var match = date.toTimeString().match(/\(([A-Za-z ]+)\)$/);
                return match ? match[1] : "GMT";
            }
            var winterName = extractZone(winter);
            var summerName = extractZone(summer);
            var winterNamePtr = allocateUTF8(winterName);
            var summerNamePtr = allocateUTF8(summerName);
            if (summerOffset < winterOffset) {
                HEAPU32[tzname >> 2] = winterNamePtr;
                HEAPU32[(tzname + 4) >> 2] = summerNamePtr;
            } else {
                HEAPU32[tzname >> 2] = summerNamePtr;
                HEAPU32[(tzname + 4) >> 2] = winterNamePtr;
            }
        }
        function __tzset_js(timezone, daylight, tzname) {
            if (__tzset_js.called) return;
            __tzset_js.called = true;
            _tzset_impl(timezone, daylight, tzname);
        }
        function _abort() {
            abort("");
        }
        var readAsmConstArgsArray = [];
        function readAsmConstArgs(sigPtr, buf) {
            readAsmConstArgsArray.length = 0;
            var ch;
            buf >>= 2;
            while ((ch = HEAPU8[sigPtr++])) {
                buf += (ch != 105) & buf;
                readAsmConstArgsArray.push(
                    ch == 105 ? HEAP32[buf] : HEAPF64[buf++ >> 1],
                );
                ++buf;
            }
            return readAsmConstArgsArray;
        }
        function _emscripten_asm_const_int(code, sigPtr, argbuf) {
            var args = readAsmConstArgs(sigPtr, argbuf);
            return ASM_CONSTS[code].apply(null, args);
        }
        function getHeapMax() {
            return 2147483648;
        }
        function _emscripten_get_heap_max() {
            return getHeapMax();
        }
        var _emscripten_get_now;
        _emscripten_get_now = () => performance.now();
        function reallyNegative(x) {
            return x < 0 || (x === 0 && 1 / x === -Infinity);
        }
        function convertI32PairToI53(lo, hi) {
            return (lo >>> 0) + hi * 4294967296;
        }
        function convertU32PairToI53(lo, hi) {
            return (lo >>> 0) + (hi >>> 0) * 4294967296;
        }
        function reSign(value, bits) {
            if (value <= 0) {
                return value;
            }
            var half =
                bits <= 32 ? Math.abs(1 << (bits - 1)) : Math.pow(2, bits - 1);
            if (value >= half && (bits <= 32 || value > half)) {
                value = -2 * half + value;
            }
            return value;
        }
        function unSign(value, bits) {
            if (value >= 0) {
                return value;
            }
            return bits <= 32
                ? 2 * Math.abs(1 << (bits - 1)) + value
                : Math.pow(2, bits) + value;
        }
        function strLen(ptr) {
            var end = ptr;
            while (HEAPU8[end]) ++end;
            return end - ptr;
        }
        function intArrayFromString(stringy, dontAddNull, length) {
            var len = length > 0 ? length : lengthBytesUTF8(stringy) + 1;
            var u8array = new Array(len);
            var numBytesWritten = stringToUTF8Array(
                stringy,
                u8array,
                0,
                u8array.length,
            );
            if (dontAddNull) u8array.length = numBytesWritten;
            return u8array;
        }
        function formatString(format, varargs) {
            var textIndex = format;
            var argIndex = varargs;
            function prepVararg(ptr, type) {
                if (type === "double" || type === "i64") {
                    if (ptr & 7) {
                        ptr += 4;
                    }
                } else {
                }
                return ptr;
            }
            function getNextArg(type) {
                var ret;
                argIndex = prepVararg(argIndex, type);
                if (type === "double") {
                    ret = HEAPF64[argIndex >> 3];
                    argIndex += 8;
                } else if (type == "i64") {
                    ret = [HEAP32[argIndex >> 2], HEAP32[(argIndex + 4) >> 2]];
                    argIndex += 8;
                } else {
                    type = "i32";
                    ret = HEAP32[argIndex >> 2];
                    argIndex += 4;
                }
                return ret;
            }
            var ret = [];
            var curr, next, currArg;
            while (1) {
                var startTextIndex = textIndex;
                curr = HEAP8[textIndex >> 0];
                if (curr === 0) break;
                next = HEAP8[(textIndex + 1) >> 0];
                if (curr == 37) {
                    var flagAlwaysSigned = false;
                    var flagLeftAlign = false;
                    var flagAlternative = false;
                    var flagZeroPad = false;
                    var flagPadSign = false;
                    flagsLoop: while (1) {
                        switch (next) {
                            case 43:
                                flagAlwaysSigned = true;
                                break;
                            case 45:
                                flagLeftAlign = true;
                                break;
                            case 35:
                                flagAlternative = true;
                                break;
                            case 48:
                                if (flagZeroPad) {
                                    break flagsLoop;
                                } else {
                                    flagZeroPad = true;
                                    break;
                                }
                            case 32:
                                flagPadSign = true;
                                break;
                            default:
                                break flagsLoop;
                        }
                        textIndex++;
                        next = HEAP8[(textIndex + 1) >> 0];
                    }
                    var width = 0;
                    if (next == 42) {
                        width = getNextArg("i32");
                        textIndex++;
                        next = HEAP8[(textIndex + 1) >> 0];
                    } else {
                        while (next >= 48 && next <= 57) {
                            width = width * 10 + (next - 48);
                            textIndex++;
                            next = HEAP8[(textIndex + 1) >> 0];
                        }
                    }
                    var precisionSet = false,
                        precision = -1;
                    if (next == 46) {
                        precision = 0;
                        precisionSet = true;
                        textIndex++;
                        next = HEAP8[(textIndex + 1) >> 0];
                        if (next == 42) {
                            precision = getNextArg("i32");
                            textIndex++;
                        } else {
                            while (1) {
                                var precisionChr = HEAP8[(textIndex + 1) >> 0];
                                if (precisionChr < 48 || precisionChr > 57)
                                    break;
                                precision =
                                    precision * 10 + (precisionChr - 48);
                                textIndex++;
                            }
                        }
                        next = HEAP8[(textIndex + 1) >> 0];
                    }
                    if (precision < 0) {
                        precision = 6;
                        precisionSet = false;
                    }
                    var argSize;
                    switch (String.fromCharCode(next)) {
                        case "h":
                            var nextNext = HEAP8[(textIndex + 2) >> 0];
                            if (nextNext == 104) {
                                textIndex++;
                                argSize = 1;
                            } else {
                                argSize = 2;
                            }
                            break;
                        case "l":
                            var nextNext = HEAP8[(textIndex + 2) >> 0];
                            if (nextNext == 108) {
                                textIndex++;
                                argSize = 8;
                            } else {
                                argSize = 4;
                            }
                            break;
                        case "L":
                        case "q":
                        case "j":
                            argSize = 8;
                            break;
                        case "z":
                        case "t":
                        case "I":
                            argSize = 4;
                            break;
                        default:
                            argSize = null;
                    }
                    if (argSize) textIndex++;
                    next = HEAP8[(textIndex + 1) >> 0];
                    switch (String.fromCharCode(next)) {
                        case "d":
                        case "i":
                        case "u":
                        case "o":
                        case "x":
                        case "X":
                        case "p": {
                            var signed = next == 100 || next == 105;
                            argSize = argSize || 4;
                            currArg = getNextArg("i" + argSize * 8);
                            var argText;
                            if (argSize == 8) {
                                currArg =
                                    next == 117
                                        ? convertU32PairToI53(
                                              currArg[0],
                                              currArg[1],
                                          )
                                        : convertI32PairToI53(
                                              currArg[0],
                                              currArg[1],
                                          );
                            }
                            if (argSize <= 4) {
                                var limit = Math.pow(256, argSize) - 1;
                                currArg = (signed ? reSign : unSign)(
                                    currArg & limit,
                                    argSize * 8,
                                );
                            }
                            var currAbsArg = Math.abs(currArg);
                            var prefix = "";
                            if (next == 100 || next == 105) {
                                argText = reSign(currArg, 8 * argSize).toString(
                                    10,
                                );
                            } else if (next == 117) {
                                argText = unSign(currArg, 8 * argSize).toString(
                                    10,
                                );
                                currArg = Math.abs(currArg);
                            } else if (next == 111) {
                                argText =
                                    (flagAlternative ? "0" : "") +
                                    currAbsArg.toString(8);
                            } else if (next == 120 || next == 88) {
                                prefix =
                                    flagAlternative && currArg != 0 ? "0x" : "";
                                if (currArg < 0) {
                                    currArg = -currArg;
                                    argText = (currAbsArg - 1).toString(16);
                                    var buffer = [];
                                    for (var i = 0; i < argText.length; i++) {
                                        buffer.push(
                                            (
                                                15 - parseInt(argText[i], 16)
                                            ).toString(16),
                                        );
                                    }
                                    argText = buffer.join("");
                                    while (argText.length < argSize * 2)
                                        argText = "f" + argText;
                                } else {
                                    argText = currAbsArg.toString(16);
                                }
                                if (next == 88) {
                                    prefix = prefix.toUpperCase();
                                    argText = argText.toUpperCase();
                                }
                            } else if (next == 112) {
                                if (currAbsArg === 0) {
                                    argText = "(nil)";
                                } else {
                                    prefix = "0x";
                                    argText = currAbsArg.toString(16);
                                }
                            }
                            if (precisionSet) {
                                while (argText.length < precision) {
                                    argText = "0" + argText;
                                }
                            }
                            if (currArg >= 0) {
                                if (flagAlwaysSigned) {
                                    prefix = "+" + prefix;
                                } else if (flagPadSign) {
                                    prefix = " " + prefix;
                                }
                            }
                            if (argText.charAt(0) == "-") {
                                prefix = "-" + prefix;
                                argText = argText.substr(1);
                            }
                            while (prefix.length + argText.length < width) {
                                if (flagLeftAlign) {
                                    argText += " ";
                                } else {
                                    if (flagZeroPad) {
                                        argText = "0" + argText;
                                    } else {
                                        prefix = " " + prefix;
                                    }
                                }
                            }
                            argText = prefix + argText;
                            argText.split("").forEach(function (chr) {
                                ret.push(chr.charCodeAt(0));
                            });
                            break;
                        }
                        case "f":
                        case "F":
                        case "e":
                        case "E":
                        case "g":
                        case "G": {
                            currArg = getNextArg("double");
                            var argText;
                            if (isNaN(currArg)) {
                                argText = "nan";
                                flagZeroPad = false;
                            } else if (!isFinite(currArg)) {
                                argText = (currArg < 0 ? "-" : "") + "inf";
                                flagZeroPad = false;
                            } else {
                                var isGeneral = false;
                                var effectivePrecision = Math.min(
                                    precision,
                                    20,
                                );
                                if (next == 103 || next == 71) {
                                    isGeneral = true;
                                    precision = precision || 1;
                                    var exponent = parseInt(
                                        currArg
                                            .toExponential(effectivePrecision)
                                            .split("e")[1],
                                        10,
                                    );
                                    if (
                                        precision > exponent &&
                                        exponent >= -4
                                    ) {
                                        next = (
                                            next == 103 ? "f" : "F"
                                        ).charCodeAt(0);
                                        precision -= exponent + 1;
                                    } else {
                                        next = (
                                            next == 103 ? "e" : "E"
                                        ).charCodeAt(0);
                                        precision--;
                                    }
                                    effectivePrecision = Math.min(
                                        precision,
                                        20,
                                    );
                                }
                                if (next == 101 || next == 69) {
                                    argText =
                                        currArg.toExponential(
                                            effectivePrecision,
                                        );
                                    if (/[eE][-+]\d$/.test(argText)) {
                                        argText =
                                            argText.slice(0, -1) +
                                            "0" +
                                            argText.slice(-1);
                                    }
                                } else if (next == 102 || next == 70) {
                                    argText =
                                        currArg.toFixed(effectivePrecision);
                                    if (
                                        currArg === 0 &&
                                        reallyNegative(currArg)
                                    ) {
                                        argText = "-" + argText;
                                    }
                                }
                                var parts = argText.split("e");
                                if (isGeneral && !flagAlternative) {
                                    while (
                                        parts[0].length > 1 &&
                                        parts[0].includes(".") &&
                                        (parts[0].slice(-1) == "0" ||
                                            parts[0].slice(-1) == ".")
                                    ) {
                                        parts[0] = parts[0].slice(0, -1);
                                    }
                                } else {
                                    if (
                                        flagAlternative &&
                                        argText.indexOf(".") == -1
                                    )
                                        parts[0] += ".";
                                    while (precision > effectivePrecision++)
                                        parts[0] += "0";
                                }
                                argText =
                                    parts[0] +
                                    (parts.length > 1 ? "e" + parts[1] : "");
                                if (next == 69) argText = argText.toUpperCase();
                                if (currArg >= 0) {
                                    if (flagAlwaysSigned) {
                                        argText = "+" + argText;
                                    } else if (flagPadSign) {
                                        argText = " " + argText;
                                    }
                                }
                            }
                            while (argText.length < width) {
                                if (flagLeftAlign) {
                                    argText += " ";
                                } else {
                                    if (
                                        flagZeroPad &&
                                        (argText[0] == "-" || argText[0] == "+")
                                    ) {
                                        argText =
                                            argText[0] + "0" + argText.slice(1);
                                    } else {
                                        argText =
                                            (flagZeroPad ? "0" : " ") + argText;
                                    }
                                }
                            }
                            if (next < 97) argText = argText.toUpperCase();
                            argText.split("").forEach(function (chr) {
                                ret.push(chr.charCodeAt(0));
                            });
                            break;
                        }
                        case "s": {
                            var arg = getNextArg("i8*");
                            var argLength = arg ? strLen(arg) : "(null)".length;
                            if (precisionSet)
                                argLength = Math.min(argLength, precision);
                            if (!flagLeftAlign) {
                                while (argLength < width--) {
                                    ret.push(32);
                                }
                            }
                            if (arg) {
                                for (var i = 0; i < argLength; i++) {
                                    ret.push(HEAPU8[arg++ >> 0]);
                                }
                            } else {
                                ret = ret.concat(
                                    intArrayFromString(
                                        "(null)".substr(0, argLength),
                                        true,
                                    ),
                                );
                            }
                            if (flagLeftAlign) {
                                while (argLength < width--) {
                                    ret.push(32);
                                }
                            }
                            break;
                        }
                        case "c": {
                            if (flagLeftAlign) ret.push(getNextArg("i8"));
                            while (--width > 0) {
                                ret.push(32);
                            }
                            if (!flagLeftAlign) ret.push(getNextArg("i8"));
                            break;
                        }
                        case "n": {
                            var ptr = getNextArg("i32*");
                            HEAP32[ptr >> 2] = ret.length;
                            break;
                        }
                        case "%": {
                            ret.push(curr);
                            break;
                        }
                        default: {
                            for (
                                var i = startTextIndex;
                                i < textIndex + 2;
                                i++
                            ) {
                                ret.push(HEAP8[i >> 0]);
                            }
                        }
                    }
                    textIndex += 2;
                } else {
                    ret.push(curr);
                    textIndex += 1;
                }
            }
            return ret;
        }
        function traverseStack(args) {
            if (!args || !args.callee || !args.callee.name) {
                return [null, "", ""];
            }
            var funstr = args.callee.toString();
            var funcname = args.callee.name;
            var str = "(";
            var first = true;
            for (var i in args) {
                var a = args[i];
                if (!first) {
                    str += ", ";
                }
                first = false;
                if (typeof a == "number" || typeof a == "string") {
                    str += a;
                } else {
                    str += "(" + typeof a + ")";
                }
            }
            str += ")";
            var caller = args.callee.caller;
            args = caller ? caller.arguments : [];
            if (first) str = "";
            return [args, funcname, str];
        }
        function warnOnce(text) {
            if (!warnOnce.shown) warnOnce.shown = {};
            if (!warnOnce.shown[text]) {
                warnOnce.shown[text] = 1;
                err(text);
            }
        }
        function _emscripten_get_callstack_js(flags) {
            var callstack = jsStackTrace();
            var iThisFunc = callstack.lastIndexOf("_emscripten_log");
            var iThisFunc2 = callstack.lastIndexOf("_emscripten_get_callstack");
            var iNextLine =
                callstack.indexOf("\n", Math.max(iThisFunc, iThisFunc2)) + 1;
            callstack = callstack.slice(iNextLine);
            if (flags & 32) {
                warnOnce("EM_LOG_DEMANGLE is deprecated; ignoring");
            }
            if (flags & 8 && typeof emscripten_source_map == "undefined") {
                warnOnce(
                    'Source map information is not available, emscripten_log with EM_LOG_C_STACK will be ignored. Build with "--pre-js $EMSCRIPTEN/src/emscripten-source-map.min.js" linker flag to add source map loading to code.',
                );
                flags ^= 8;
                flags |= 16;
            }
            var stack_args = null;
            if (flags & 128) {
                stack_args = traverseStack(arguments);
                while (stack_args[1].includes("_emscripten_"))
                    stack_args = traverseStack(stack_args[0]);
            }
            var lines = callstack.split("\n");
            callstack = "";
            var newFirefoxRe = new RegExp("\\s*(.*?)@(.*?):([0-9]+):([0-9]+)");
            var firefoxRe = new RegExp("\\s*(.*?)@(.*):(.*)(:(.*))?");
            var chromeRe = new RegExp("\\s*at (.*?) \\((.*):(.*):(.*)\\)");
            for (var l in lines) {
                var line = lines[l];
                var symbolName = "";
                var file = "";
                var lineno = 0;
                var column = 0;
                var parts = chromeRe.exec(line);
                if (parts && parts.length == 5) {
                    symbolName = parts[1];
                    file = parts[2];
                    lineno = parts[3];
                    column = parts[4];
                } else {
                    parts = newFirefoxRe.exec(line);
                    if (!parts) parts = firefoxRe.exec(line);
                    if (parts && parts.length >= 4) {
                        symbolName = parts[1];
                        file = parts[2];
                        lineno = parts[3];
                        column = parts[4] | 0;
                    } else {
                        callstack += line + "\n";
                        continue;
                    }
                }
                var haveSourceMap = false;
                if (flags & 8) {
                    var orig = emscripten_source_map.originalPositionFor({
                        line: lineno,
                        column: column,
                    });
                    haveSourceMap = orig && orig.source;
                    if (haveSourceMap) {
                        if (flags & 64) {
                            orig.source = orig.source.substring(
                                orig.source
                                    .replace(/\\/g, "/")
                                    .lastIndexOf("/") + 1,
                            );
                        }
                        callstack +=
                            "    at " +
                            symbolName +
                            " (" +
                            orig.source +
                            ":" +
                            orig.line +
                            ":" +
                            orig.column +
                            ")\n";
                    }
                }
                if (flags & 16 || !haveSourceMap) {
                    if (flags & 64) {
                        file = file.substring(
                            file.replace(/\\/g, "/").lastIndexOf("/") + 1,
                        );
                    }
                    callstack +=
                        (haveSourceMap
                            ? "     = " + symbolName
                            : "    at " + symbolName) +
                        " (" +
                        file +
                        ":" +
                        lineno +
                        ":" +
                        column +
                        ")\n";
                }
                if (flags & 128 && stack_args[0]) {
                    if (
                        stack_args[1] == symbolName &&
                        stack_args[2].length > 0
                    ) {
                        callstack = callstack.replace(/\s+$/, "");
                        callstack +=
                            " with values: " +
                            stack_args[1] +
                            stack_args[2] +
                            "\n";
                    }
                    stack_args = traverseStack(stack_args[0]);
                }
            }
            callstack = callstack.replace(/\s+$/, "");
            return callstack;
        }
        function _emscripten_log_js(flags, str) {
            if (flags & 24) {
                str = str.replace(/\s+$/, "");
                str +=
                    (str.length > 0 ? "\n" : "") +
                    _emscripten_get_callstack_js(flags);
            }
            if (flags & 1) {
                if (flags & 4) {
                    console.error(str);
                } else if (flags & 2) {
                    console.warn(str);
                } else if (flags & 512) {
                    console.info(str);
                } else if (flags & 256) {
                    console.debug(str);
                } else {
                    console.log(str);
                }
            } else if (flags & 6) {
                err(str);
            } else {
                out(str);
            }
        }
        function _emscripten_log(flags, format, varargs) {
            var result = formatString(format, varargs);
            var str = UTF8ArrayToString(result, 0);
            _emscripten_log_js(flags, str);
        }
        function emscripten_realloc_buffer(size) {
            try {
                wasmMemory.grow((size - buffer.byteLength + 65535) >>> 16);
                updateGlobalBufferAndViews(wasmMemory.buffer);
                return 1;
            } catch (e) {}
        }
        function _emscripten_resize_heap(requestedSize) {
            var oldSize = HEAPU8.length;
            requestedSize = requestedSize >>> 0;
            var maxHeapSize = getHeapMax();
            if (requestedSize > maxHeapSize) {
                return false;
            }
            let alignUp = (x, multiple) =>
                x + ((multiple - (x % multiple)) % multiple);
            for (var cutDown = 1; cutDown <= 4; cutDown *= 2) {
                var overGrownHeapSize = oldSize * (1 + 0.2 / cutDown);
                overGrownHeapSize = Math.min(
                    overGrownHeapSize,
                    requestedSize + 100663296,
                );
                var newSize = Math.min(
                    maxHeapSize,
                    alignUp(Math.max(requestedSize, overGrownHeapSize), 65536),
                );
                var replacement = emscripten_realloc_buffer(newSize);
                if (replacement) {
                    return true;
                }
            }
            return false;
        }
        var ENV = {};
        function getExecutableName() {
            return thisProgram || "./this.program";
        }
        function getEnvStrings() {
            if (!getEnvStrings.strings) {
                var lang =
                    (
                        (typeof navigator == "object" &&
                            navigator.languages &&
                            navigator.languages[0]) ||
                        "C"
                    ).replace("-", "_") + ".UTF-8";
                var env = {
                    USER: "web_user",
                    LOGNAME: "web_user",
                    PATH: "/",
                    PWD: "/",
                    HOME: "/home/web_user",
                    LANG: lang,
                    _: getExecutableName(),
                };
                for (var x in ENV) {
                    if (ENV[x] === undefined) delete env[x];
                    else env[x] = ENV[x];
                }
                var strings = [];
                for (var x in env) {
                    strings.push(x + "=" + env[x]);
                }
                getEnvStrings.strings = strings;
            }
            return getEnvStrings.strings;
        }
        function writeAsciiToMemory(str, buffer, dontAddNull) {
            for (var i = 0; i < str.length; ++i) {
                HEAP8[buffer++ >> 0] = str.charCodeAt(i);
            }
            if (!dontAddNull) HEAP8[buffer >> 0] = 0;
        }
        function _environ_get(__environ, environ_buf) {
            var bufSize = 0;
            getEnvStrings().forEach(function (string, i) {
                var ptr = environ_buf + bufSize;
                HEAPU32[(__environ + i * 4) >> 2] = ptr;
                writeAsciiToMemory(string, ptr);
                bufSize += string.length + 1;
            });
            return 0;
        }
        function _environ_sizes_get(penviron_count, penviron_buf_size) {
            var strings = getEnvStrings();
            HEAPU32[penviron_count >> 2] = strings.length;
            var bufSize = 0;
            strings.forEach(function (string) {
                bufSize += string.length + 1;
            });
            HEAPU32[penviron_buf_size >> 2] = bufSize;
            return 0;
        }
        function _fd_close(fd) {
            return 52;
        }
        function _fd_read(fd, iov, iovcnt, pnum) {
            return 52;
        }
        function _fd_seek(fd, offset_low, offset_high, whence, newOffset) {
            return 70;
        }
        var printCharBuffers = [null, [], []];
        function printChar(stream, curr) {
            var buffer = printCharBuffers[stream];
            if (curr === 0 || curr === 10) {
                (stream === 1 ? out : err)(UTF8ArrayToString(buffer, 0));
                buffer.length = 0;
            } else {
                buffer.push(curr);
            }
        }
        function _fd_write(fd, iov, iovcnt, pnum) {
            var num = 0;
            for (var i = 0; i < iovcnt; i++) {
                var ptr = HEAPU32[iov >> 2];
                var len = HEAPU32[(iov + 4) >> 2];
                iov += 8;
                for (var j = 0; j < len; j++) {
                    printChar(fd, HEAPU8[ptr + j]);
                }
                num += len;
            }
            HEAPU32[pnum >> 2] = num;
            return 0;
        }
        var tempRet0 = 0;
        function getTempRet0() {
            return tempRet0;
        }
        var _getTempRet0 = getTempRet0;
        function getRandomDevice() {
            if (
                typeof crypto == "object" &&
                typeof crypto["getRandomValues"] == "function"
            ) {
                var randomBuffer = new Uint8Array(1);
                return () => {
                    crypto.getRandomValues(randomBuffer);
                    return randomBuffer[0];
                };
            } else return () => abort("randomDevice");
        }
        function _getentropy(buffer, size) {
            if (!_getentropy.randomDevice) {
                _getentropy.randomDevice = getRandomDevice();
            }
            for (var i = 0; i < size; i++) {
                HEAP8[(buffer + i) >> 0] = _getentropy.randomDevice();
            }
            return 0;
        }
        function _llvm_eh_typeid_for(type) {
            return type;
        }
        function setTempRet0(val) {
            tempRet0 = val;
        }
        var _setTempRet0 = setTempRet0;
        function __isLeapYear(year) {
            return year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0);
        }
        function __arraySum(array, index) {
            var sum = 0;
            for (var i = 0; i <= index; sum += array[i++]) {}
            return sum;
        }
        var __MONTH_DAYS_LEAP = [
            31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
        ];
        var __MONTH_DAYS_REGULAR = [
            31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
        ];
        function __addDays(date, days) {
            var newDate = new Date(date.getTime());
            while (days > 0) {
                var leap = __isLeapYear(newDate.getFullYear());
                var currentMonth = newDate.getMonth();
                var daysInCurrentMonth = (
                    leap ? __MONTH_DAYS_LEAP : __MONTH_DAYS_REGULAR
                )[currentMonth];
                if (days > daysInCurrentMonth - newDate.getDate()) {
                    days -= daysInCurrentMonth - newDate.getDate() + 1;
                    newDate.setDate(1);
                    if (currentMonth < 11) {
                        newDate.setMonth(currentMonth + 1);
                    } else {
                        newDate.setMonth(0);
                        newDate.setFullYear(newDate.getFullYear() + 1);
                    }
                } else {
                    newDate.setDate(newDate.getDate() + days);
                    return newDate;
                }
            }
            return newDate;
        }
        function _strftime(s, maxsize, format, tm) {
            var tm_zone = HEAP32[(tm + 40) >> 2];
            var date = {
                tm_sec: HEAP32[tm >> 2],
                tm_min: HEAP32[(tm + 4) >> 2],
                tm_hour: HEAP32[(tm + 8) >> 2],
                tm_mday: HEAP32[(tm + 12) >> 2],
                tm_mon: HEAP32[(tm + 16) >> 2],
                tm_year: HEAP32[(tm + 20) >> 2],
                tm_wday: HEAP32[(tm + 24) >> 2],
                tm_yday: HEAP32[(tm + 28) >> 2],
                tm_isdst: HEAP32[(tm + 32) >> 2],
                tm_gmtoff: HEAP32[(tm + 36) >> 2],
                tm_zone: tm_zone ? UTF8ToString(tm_zone) : "",
            };
            var pattern = UTF8ToString(format);
            var EXPANSION_RULES_1 = {
                "%c": "%a %b %d %H:%M:%S %Y",
                "%D": "%m/%d/%y",
                "%F": "%Y-%m-%d",
                "%h": "%b",
                "%r": "%I:%M:%S %p",
                "%R": "%H:%M",
                "%T": "%H:%M:%S",
                "%x": "%m/%d/%y",
                "%X": "%H:%M:%S",
                "%Ec": "%c",
                "%EC": "%C",
                "%Ex": "%m/%d/%y",
                "%EX": "%H:%M:%S",
                "%Ey": "%y",
                "%EY": "%Y",
                "%Od": "%d",
                "%Oe": "%e",
                "%OH": "%H",
                "%OI": "%I",
                "%Om": "%m",
                "%OM": "%M",
                "%OS": "%S",
                "%Ou": "%u",
                "%OU": "%U",
                "%OV": "%V",
                "%Ow": "%w",
                "%OW": "%W",
                "%Oy": "%y",
            };
            for (var rule in EXPANSION_RULES_1) {
                pattern = pattern.replace(
                    new RegExp(rule, "g"),
                    EXPANSION_RULES_1[rule],
                );
            }
            var WEEKDAYS = [
                "Sunday",
                "Monday",
                "Tuesday",
                "Wednesday",
                "Thursday",
                "Friday",
                "Saturday",
            ];
            var MONTHS = [
                "January",
                "February",
                "March",
                "April",
                "May",
                "June",
                "July",
                "August",
                "September",
                "October",
                "November",
                "December",
            ];
            function leadingSomething(value, digits, character) {
                var str =
                    typeof value == "number" ? value.toString() : value || "";
                while (str.length < digits) {
                    str = character[0] + str;
                }
                return str;
            }
            function leadingNulls(value, digits) {
                return leadingSomething(value, digits, "0");
            }
            function compareByDay(date1, date2) {
                function sgn(value) {
                    return value < 0 ? -1 : value > 0 ? 1 : 0;
                }
                var compare;
                if (
                    (compare = sgn(
                        date1.getFullYear() - date2.getFullYear(),
                    )) === 0
                ) {
                    if (
                        (compare = sgn(date1.getMonth() - date2.getMonth())) ===
                        0
                    ) {
                        compare = sgn(date1.getDate() - date2.getDate());
                    }
                }
                return compare;
            }
            function getFirstWeekStartDate(janFourth) {
                switch (janFourth.getDay()) {
                    case 0:
                        return new Date(janFourth.getFullYear() - 1, 11, 29);
                    case 1:
                        return janFourth;
                    case 2:
                        return new Date(janFourth.getFullYear(), 0, 3);
                    case 3:
                        return new Date(janFourth.getFullYear(), 0, 2);
                    case 4:
                        return new Date(janFourth.getFullYear(), 0, 1);
                    case 5:
                        return new Date(janFourth.getFullYear() - 1, 11, 31);
                    case 6:
                        return new Date(janFourth.getFullYear() - 1, 11, 30);
                }
            }
            function getWeekBasedYear(date) {
                var thisDate = __addDays(
                    new Date(date.tm_year + 1900, 0, 1),
                    date.tm_yday,
                );
                var janFourthThisYear = new Date(thisDate.getFullYear(), 0, 4);
                var janFourthNextYear = new Date(
                    thisDate.getFullYear() + 1,
                    0,
                    4,
                );
                var firstWeekStartThisYear =
                    getFirstWeekStartDate(janFourthThisYear);
                var firstWeekStartNextYear =
                    getFirstWeekStartDate(janFourthNextYear);
                if (compareByDay(firstWeekStartThisYear, thisDate) <= 0) {
                    if (compareByDay(firstWeekStartNextYear, thisDate) <= 0) {
                        return thisDate.getFullYear() + 1;
                    }
                    return thisDate.getFullYear();
                }
                return thisDate.getFullYear() - 1;
            }
            var EXPANSION_RULES_2 = {
                "%a": function (date) {
                    return WEEKDAYS[date.tm_wday].substring(0, 3);
                },
                "%A": function (date) {
                    return WEEKDAYS[date.tm_wday];
                },
                "%b": function (date) {
                    return MONTHS[date.tm_mon].substring(0, 3);
                },
                "%B": function (date) {
                    return MONTHS[date.tm_mon];
                },
                "%C": function (date) {
                    var year = date.tm_year + 1900;
                    return leadingNulls((year / 100) | 0, 2);
                },
                "%d": function (date) {
                    return leadingNulls(date.tm_mday, 2);
                },
                "%e": function (date) {
                    return leadingSomething(date.tm_mday, 2, " ");
                },
                "%g": function (date) {
                    return getWeekBasedYear(date).toString().substring(2);
                },
                "%G": function (date) {
                    return getWeekBasedYear(date);
                },
                "%H": function (date) {
                    return leadingNulls(date.tm_hour, 2);
                },
                "%I": function (date) {
                    var twelveHour = date.tm_hour;
                    if (twelveHour == 0) twelveHour = 12;
                    else if (twelveHour > 12) twelveHour -= 12;
                    return leadingNulls(twelveHour, 2);
                },
                "%j": function (date) {
                    return leadingNulls(
                        date.tm_mday +
                            __arraySum(
                                __isLeapYear(date.tm_year + 1900)
                                    ? __MONTH_DAYS_LEAP
                                    : __MONTH_DAYS_REGULAR,
                                date.tm_mon - 1,
                            ),
                        3,
                    );
                },
                "%m": function (date) {
                    return leadingNulls(date.tm_mon + 1, 2);
                },
                "%M": function (date) {
                    return leadingNulls(date.tm_min, 2);
                },
                "%n": function () {
                    return "\n";
                },
                "%p": function (date) {
                    if (date.tm_hour >= 0 && date.tm_hour < 12) {
                        return "AM";
                    }
                    return "PM";
                },
                "%S": function (date) {
                    return leadingNulls(date.tm_sec, 2);
                },
                "%t": function () {
                    return "\t";
                },
                "%u": function (date) {
                    return date.tm_wday || 7;
                },
                "%U": function (date) {
                    var days = date.tm_yday + 7 - date.tm_wday;
                    return leadingNulls(Math.floor(days / 7), 2);
                },
                "%V": function (date) {
                    var val = Math.floor(
                        (date.tm_yday + 7 - ((date.tm_wday + 6) % 7)) / 7,
                    );
                    if ((date.tm_wday + 371 - date.tm_yday - 2) % 7 <= 2) {
                        val++;
                    }
                    if (!val) {
                        val = 52;
                        var dec31 = (date.tm_wday + 7 - date.tm_yday - 1) % 7;
                        if (
                            dec31 == 4 ||
                            (dec31 == 5 &&
                                __isLeapYear((date.tm_year % 400) - 1))
                        ) {
                            val++;
                        }
                    } else if (val == 53) {
                        var jan1 = (date.tm_wday + 371 - date.tm_yday) % 7;
                        if (
                            jan1 != 4 &&
                            (jan1 != 3 || !__isLeapYear(date.tm_year))
                        )
                            val = 1;
                    }
                    return leadingNulls(val, 2);
                },
                "%w": function (date) {
                    return date.tm_wday;
                },
                "%W": function (date) {
                    var days = date.tm_yday + 7 - ((date.tm_wday + 6) % 7);
                    return leadingNulls(Math.floor(days / 7), 2);
                },
                "%y": function (date) {
                    return (date.tm_year + 1900).toString().substring(2);
                },
                "%Y": function (date) {
                    return date.tm_year + 1900;
                },
                "%z": function (date) {
                    var off = date.tm_gmtoff;
                    var ahead = off >= 0;
                    off = Math.abs(off) / 60;
                    off = (off / 60) * 100 + (off % 60);
                    return (ahead ? "+" : "-") + String("0000" + off).slice(-4);
                },
                "%Z": function (date) {
                    return date.tm_zone;
                },
                "%%": function () {
                    return "%";
                },
            };
            pattern = pattern.replace(/%%/g, "\0\0");
            for (var rule in EXPANSION_RULES_2) {
                if (pattern.includes(rule)) {
                    pattern = pattern.replace(
                        new RegExp(rule, "g"),
                        EXPANSION_RULES_2[rule](date),
                    );
                }
            }
            pattern = pattern.replace(/\0\0/g, "%");
            var bytes = intArrayFromString(pattern, false);
            if (bytes.length > maxsize) {
                return 0;
            }
            writeArrayToMemory(bytes, s);
            return bytes.length - 1;
        }
        function _strftime_l(s, maxsize, format, tm) {
            return _strftime(s, maxsize, format, tm);
        }
        var ALLOC_NORMAL = 0;
        var ALLOC_STACK = 1;
        function allocate(slab, allocator) {
            var ret;
            if (allocator == ALLOC_STACK) {
                ret = stackAlloc(slab.length);
            } else {
                ret = _malloc(slab.length);
            }
            if (!slab.subarray && !slab.slice) {
                slab = new Uint8Array(slab);
            }
            HEAPU8.set(slab, ret);
            return ret;
        }
        var asmLibraryArg = {
            l: ___cxa_allocate_exception,
            s: ___cxa_begin_catch,
            w: ___cxa_end_catch,
            b: ___cxa_find_matching_catch_2,
            i: ___cxa_find_matching_catch_3,
            C: ___cxa_find_matching_catch_4,
            L: ___cxa_find_matching_catch_6,
            t: ___cxa_free_exception,
            U: ___cxa_rethrow,
            m: ___cxa_throw,
            A: ___cxa_uncaught_exceptions,
            e: ___resumeException,
            S: ___syscall_fcntl64,
            Ca: ___syscall_fstat64,
            va: ___syscall_getdents64,
            Q: ___syscall_ioctl,
            za: ___syscall_lstat64,
            Aa: ___syscall_newfstatat,
            R: ___syscall_openat,
            Ba: ___syscall_stat64,
            J: __emscripten_date_now,
            Ea: __emscripten_get_now_is_monotonic,
            Fa: __gmtime_js,
            Ga: __localtime_js,
            wa: __munmap_js,
            Ha: __tzset_js,
            v: _abort,
            K: _emscripten_asm_const_int,
            ua: _emscripten_get_heap_max,
            Da: _emscripten_get_now,
            T: _emscripten_log,
            ta: _emscripten_resize_heap,
            xa: _environ_get,
            ya: _environ_sizes_get,
            H: _fd_close,
            O: _fd_read,
            Y: _fd_seek,
            P: _fd_write,
            a: _getTempRet0,
            qa: _getentropy,
            F: invoke_di,
            M: invoke_diii,
            N: invoke_fiii,
            y: invoke_i,
            f: invoke_ii,
            c: invoke_iii,
            k: invoke_iiii,
            j: invoke_iiiii,
            sa: invoke_iiiiid,
            o: invoke_iiiiii,
            r: invoke_iiiiiii,
            p: invoke_iiiiiiii,
            Ia: invoke_iiiiiiiii,
            V: invoke_iiiiiiiiii,
            W: invoke_iiiiiiiiiii,
            I: invoke_iiiiiiiiiiii,
            Z: invoke_iiiiij,
            ca: invoke_iiiiijj,
            ga: invoke_iiiij,
            ma: invoke_iiiijii,
            da: invoke_iiij,
            pa: invoke_iij,
            la: invoke_iiji,
            _: invoke_iijj,
            na: invoke_j,
            oa: invoke_ji,
            ka: invoke_jii,
            aa: invoke_jiii,
            X: invoke_jiiii,
            fa: invoke_jijj,
            q: invoke_v,
            d: invoke_vi,
            h: invoke_vii,
            g: invoke_viii,
            n: invoke_viiii,
            u: invoke_viiiii,
            z: invoke_viiiiii,
            B: invoke_viiiiiii,
            E: invoke_viiiiiiiiii,
            G: invoke_viiiiiiiiiiiiiii,
            $: invoke_viiiijiiiiiiiiiiiij,
            ea: invoke_viiijjj,
            ha: invoke_viij,
            ba: invoke_viijjj,
            ia: invoke_vij,
            ja: invoke_viji,
            x: _llvm_eh_typeid_for,
            D: _setTempRet0,
            ra: _strftime_l,
        };
        var asm = createWasm();
        var ___wasm_call_ctors = (Module["___wasm_call_ctors"] = function () {
            return (___wasm_call_ctors = Module["___wasm_call_ctors"] =
                Module["asm"]["Ka"]).apply(null, arguments);
        });
        var _create_emulator = (Module["_create_emulator"] = function () {
            return (_create_emulator = Module["_create_emulator"] =
                Module["asm"]["La"]).apply(null, arguments);
        });
        var _destroy_emulator = (Module["_destroy_emulator"] = function () {
            return (_destroy_emulator = Module["_destroy_emulator"] =
                Module["asm"]["Ma"]).apply(null, arguments);
        });
        var _emulate_with_emulator = (Module["_emulate_with_emulator"] =
            function () {
                return (_emulate_with_emulator = Module[
                    "_emulate_with_emulator"
                ] =
                    Module["asm"]["Na"]).apply(null, arguments);
            });
        var _free = (Module["_free"] = function () {
            return (_free = Module["_free"] = Module["asm"]["Oa"]).apply(
                null,
                arguments,
            );
        });
        var _emulate = (Module["_emulate"] = function () {
            return (_emulate = Module["_emulate"] = Module["asm"]["Pa"]).apply(
                null,
                arguments,
            );
        });
        var _run_get_method = (Module["_run_get_method"] = function () {
            return (_run_get_method = Module["_run_get_method"] =
                Module["asm"]["Qa"]).apply(null, arguments);
        });
        var _version = (Module["_version"] = function () {
            return (_version = Module["_version"] = Module["asm"]["Ra"]).apply(
                null,
                arguments,
            );
        });
        var _malloc = (Module["_malloc"] = function () {
            return (_malloc = Module["_malloc"] = Module["asm"]["Ta"]).apply(
                null,
                arguments,
            );
        });
        var _setThrew = (Module["_setThrew"] = function () {
            return (_setThrew = Module["_setThrew"] =
                Module["asm"]["Ua"]).apply(null, arguments);
        });
        var stackSave = (Module["stackSave"] = function () {
            return (stackSave = Module["stackSave"] =
                Module["asm"]["Va"]).apply(null, arguments);
        });
        var stackRestore = (Module["stackRestore"] = function () {
            return (stackRestore = Module["stackRestore"] =
                Module["asm"]["Wa"]).apply(null, arguments);
        });
        var stackAlloc = (Module["stackAlloc"] = function () {
            return (stackAlloc = Module["stackAlloc"] =
                Module["asm"]["Xa"]).apply(null, arguments);
        });
        var ___cxa_can_catch = (Module["___cxa_can_catch"] = function () {
            return (___cxa_can_catch = Module["___cxa_can_catch"] =
                Module["asm"]["Ya"]).apply(null, arguments);
        });
        var ___cxa_is_pointer_type = (Module["___cxa_is_pointer_type"] =
            function () {
                return (___cxa_is_pointer_type = Module[
                    "___cxa_is_pointer_type"
                ] =
                    Module["asm"]["Za"]).apply(null, arguments);
            });
        var dynCall_iij = (Module["dynCall_iij"] = function () {
            return (dynCall_iij = Module["dynCall_iij"] =
                Module["asm"]["_a"]).apply(null, arguments);
        });
        var dynCall_j = (Module["dynCall_j"] = function () {
            return (dynCall_j = Module["dynCall_j"] =
                Module["asm"]["$a"]).apply(null, arguments);
        });
        var dynCall_ji = (Module["dynCall_ji"] = function () {
            return (dynCall_ji = Module["dynCall_ji"] =
                Module["asm"]["ab"]).apply(null, arguments);
        });
        var dynCall_iiiijii = (Module["dynCall_iiiijii"] = function () {
            return (dynCall_iiiijii = Module["dynCall_iiiijii"] =
                Module["asm"]["bb"]).apply(null, arguments);
        });
        var dynCall_iiji = (Module["dynCall_iiji"] = function () {
            return (dynCall_iiji = Module["dynCall_iiji"] =
                Module["asm"]["cb"]).apply(null, arguments);
        });
        var dynCall_jii = (Module["dynCall_jii"] = function () {
            return (dynCall_jii = Module["dynCall_jii"] =
                Module["asm"]["db"]).apply(null, arguments);
        });
        var dynCall_viji = (Module["dynCall_viji"] = function () {
            return (dynCall_viji = Module["dynCall_viji"] =
                Module["asm"]["eb"]).apply(null, arguments);
        });
        var dynCall_vij = (Module["dynCall_vij"] = function () {
            return (dynCall_vij = Module["dynCall_vij"] =
                Module["asm"]["fb"]).apply(null, arguments);
        });
        var dynCall_viij = (Module["dynCall_viij"] = function () {
            return (dynCall_viij = Module["dynCall_viij"] =
                Module["asm"]["gb"]).apply(null, arguments);
        });
        var dynCall_iiiij = (Module["dynCall_iiiij"] = function () {
            return (dynCall_iiiij = Module["dynCall_iiiij"] =
                Module["asm"]["hb"]).apply(null, arguments);
        });
        var dynCall_jijj = (Module["dynCall_jijj"] = function () {
            return (dynCall_jijj = Module["dynCall_jijj"] =
                Module["asm"]["ib"]).apply(null, arguments);
        });
        var dynCall_viiijjj = (Module["dynCall_viiijjj"] = function () {
            return (dynCall_viiijjj = Module["dynCall_viiijjj"] =
                Module["asm"]["jb"]).apply(null, arguments);
        });
        var dynCall_iiij = (Module["dynCall_iiij"] = function () {
            return (dynCall_iiij = Module["dynCall_iiij"] =
                Module["asm"]["kb"]).apply(null, arguments);
        });
        var dynCall_iiiiijj = (Module["dynCall_iiiiijj"] = function () {
            return (dynCall_iiiiijj = Module["dynCall_iiiiijj"] =
                Module["asm"]["lb"]).apply(null, arguments);
        });
        var dynCall_viijjj = (Module["dynCall_viijjj"] = function () {
            return (dynCall_viijjj = Module["dynCall_viijjj"] =
                Module["asm"]["mb"]).apply(null, arguments);
        });
        var dynCall_jiii = (Module["dynCall_jiii"] = function () {
            return (dynCall_jiii = Module["dynCall_jiii"] =
                Module["asm"]["nb"]).apply(null, arguments);
        });
        var dynCall_viiiijiiiiiiiiiiiij = (Module[
            "dynCall_viiiijiiiiiiiiiiiij"
        ] = function () {
            return (dynCall_viiiijiiiiiiiiiiiij = Module[
                "dynCall_viiiijiiiiiiiiiiiij"
            ] =
                Module["asm"]["ob"]).apply(null, arguments);
        });
        var dynCall_iijj = (Module["dynCall_iijj"] = function () {
            return (dynCall_iijj = Module["dynCall_iijj"] =
                Module["asm"]["pb"]).apply(null, arguments);
        });
        var dynCall_iiiiij = (Module["dynCall_iiiiij"] = function () {
            return (dynCall_iiiiij = Module["dynCall_iiiiij"] =
                Module["asm"]["qb"]).apply(null, arguments);
        });
        var dynCall_jiiii = (Module["dynCall_jiiii"] = function () {
            return (dynCall_jiiii = Module["dynCall_jiiii"] =
                Module["asm"]["rb"]).apply(null, arguments);
        });
        function invoke_ii(index, a1) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_vi(index, a1) {
            var sp = stackSave();
            try {
                getWasmTableEntry(index)(a1);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_vii(index, a1, a2) {
            var sp = stackSave();
            try {
                getWasmTableEntry(index)(a1, a2);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viii(index, a1, a2, a3) {
            var sp = stackSave();
            try {
                getWasmTableEntry(index)(a1, a2, a3);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viiiii(index, a1, a2, a3, a4, a5) {
            var sp = stackSave();
            try {
                getWasmTableEntry(index)(a1, a2, a3, a4, a5);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iii(index, a1, a2) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1, a2);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiii(index, a1, a2, a3, a4) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1, a2, a3, a4);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_v(index) {
            var sp = stackSave();
            try {
                getWasmTableEntry(index)();
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiii(index, a1, a2, a3) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1, a2, a3);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiiii(index, a1, a2, a3, a4, a5) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1, a2, a3, a4, a5);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_i(index) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)();
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viiii(index, a1, a2, a3, a4) {
            var sp = stackSave();
            try {
                getWasmTableEntry(index)(a1, a2, a3, a4);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiiiii(index, a1, a2, a3, a4, a5, a6) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1, a2, a3, a4, a5, a6);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiiiiii(index, a1, a2, a3, a4, a5, a6, a7) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1, a2, a3, a4, a5, a6, a7);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiiiiiiiii(
            index,
            a1,
            a2,
            a3,
            a4,
            a5,
            a6,
            a7,
            a8,
            a9,
            a10,
        ) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(
                    a1,
                    a2,
                    a3,
                    a4,
                    a5,
                    a6,
                    a7,
                    a8,
                    a9,
                    a10,
                );
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiiiiiiiiii(
            index,
            a1,
            a2,
            a3,
            a4,
            a5,
            a6,
            a7,
            a8,
            a9,
            a10,
            a11,
        ) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(
                    a1,
                    a2,
                    a3,
                    a4,
                    a5,
                    a6,
                    a7,
                    a8,
                    a9,
                    a10,
                    a11,
                );
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiiiiiii(index, a1, a2, a3, a4, a5, a6, a7, a8) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1, a2, a3, a4, a5, a6, a7, a8);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viiiiiii(index, a1, a2, a3, a4, a5, a6, a7) {
            var sp = stackSave();
            try {
                getWasmTableEntry(index)(a1, a2, a3, a4, a5, a6, a7);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viiiiii(index, a1, a2, a3, a4, a5, a6) {
            var sp = stackSave();
            try {
                getWasmTableEntry(index)(a1, a2, a3, a4, a5, a6);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiiiiiiii(index, a1, a2, a3, a4, a5, a6, a7, a8, a9) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(
                    a1,
                    a2,
                    a3,
                    a4,
                    a5,
                    a6,
                    a7,
                    a8,
                    a9,
                );
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_di(index, a1) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiiid(index, a1, a2, a3, a4, a5) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1, a2, a3, a4, a5);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_fiii(index, a1, a2, a3) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1, a2, a3);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_diii(index, a1, a2, a3) {
            var sp = stackSave();
            try {
                return getWasmTableEntry(index)(a1, a2, a3);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viiiiiiiiii(
            index,
            a1,
            a2,
            a3,
            a4,
            a5,
            a6,
            a7,
            a8,
            a9,
            a10,
        ) {
            var sp = stackSave();
            try {
                getWasmTableEntry(index)(
                    a1,
                    a2,
                    a3,
                    a4,
                    a5,
                    a6,
                    a7,
                    a8,
                    a9,
                    a10,
                );
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viiiiiiiiiiiiiii(
            index,
            a1,
            a2,
            a3,
            a4,
            a5,
            a6,
            a7,
            a8,
            a9,
            a10,
            a11,
            a12,
            a13,
            a14,
            a15,
        ) {
            var sp = stackSave();
            try {
                getWasmTableEntry(index)(
                    a1,
                    a2,
                    a3,
                    a4,
                    a5,
                    a6,
                    a7,
                    a8,
                    a9,
                    a10,
                    a11,
                    a12,
                    a13,
                    a14,
                    a15,
                );
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iij(index, a1, a2, a3) {
            var sp = stackSave();
            try {
                return dynCall_iij(index, a1, a2, a3);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_ji(index, a1) {
            var sp = stackSave();
            try {
                return dynCall_ji(index, a1);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_j(index) {
            var sp = stackSave();
            try {
                return dynCall_j(index);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiijii(index, a1, a2, a3, a4, a5, a6, a7) {
            var sp = stackSave();
            try {
                return dynCall_iiiijii(index, a1, a2, a3, a4, a5, a6, a7);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiji(index, a1, a2, a3, a4) {
            var sp = stackSave();
            try {
                return dynCall_iiji(index, a1, a2, a3, a4);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_jii(index, a1, a2) {
            var sp = stackSave();
            try {
                return dynCall_jii(index, a1, a2);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viji(index, a1, a2, a3, a4) {
            var sp = stackSave();
            try {
                dynCall_viji(index, a1, a2, a3, a4);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_vij(index, a1, a2, a3) {
            var sp = stackSave();
            try {
                dynCall_vij(index, a1, a2, a3);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viij(index, a1, a2, a3, a4) {
            var sp = stackSave();
            try {
                dynCall_viij(index, a1, a2, a3, a4);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiij(index, a1, a2, a3, a4, a5) {
            var sp = stackSave();
            try {
                return dynCall_iiiij(index, a1, a2, a3, a4, a5);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_jijj(index, a1, a2, a3, a4, a5) {
            var sp = stackSave();
            try {
                return dynCall_jijj(index, a1, a2, a3, a4, a5);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viiijjj(index, a1, a2, a3, a4, a5, a6, a7, a8, a9) {
            var sp = stackSave();
            try {
                dynCall_viiijjj(index, a1, a2, a3, a4, a5, a6, a7, a8, a9);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiij(index, a1, a2, a3, a4) {
            var sp = stackSave();
            try {
                return dynCall_iiij(index, a1, a2, a3, a4);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiiijj(index, a1, a2, a3, a4, a5, a6, a7, a8) {
            var sp = stackSave();
            try {
                return dynCall_iiiiijj(index, a1, a2, a3, a4, a5, a6, a7, a8);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viijjj(index, a1, a2, a3, a4, a5, a6, a7, a8) {
            var sp = stackSave();
            try {
                dynCall_viijjj(index, a1, a2, a3, a4, a5, a6, a7, a8);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_jiii(index, a1, a2, a3) {
            var sp = stackSave();
            try {
                return dynCall_jiii(index, a1, a2, a3);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_viiiijiiiiiiiiiiiij(
            index,
            a1,
            a2,
            a3,
            a4,
            a5,
            a6,
            a7,
            a8,
            a9,
            a10,
            a11,
            a12,
            a13,
            a14,
            a15,
            a16,
            a17,
            a18,
            a19,
            a20,
        ) {
            var sp = stackSave();
            try {
                dynCall_viiiijiiiiiiiiiiiij(
                    index,
                    a1,
                    a2,
                    a3,
                    a4,
                    a5,
                    a6,
                    a7,
                    a8,
                    a9,
                    a10,
                    a11,
                    a12,
                    a13,
                    a14,
                    a15,
                    a16,
                    a17,
                    a18,
                    a19,
                    a20,
                );
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iijj(index, a1, a2, a3, a4, a5) {
            var sp = stackSave();
            try {
                return dynCall_iijj(index, a1, a2, a3, a4, a5);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_iiiiij(index, a1, a2, a3, a4, a5, a6) {
            var sp = stackSave();
            try {
                return dynCall_iiiiij(index, a1, a2, a3, a4, a5, a6);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        function invoke_jiiii(index, a1, a2, a3, a4) {
            var sp = stackSave();
            try {
                return dynCall_jiiii(index, a1, a2, a3, a4);
            } catch (e) {
                stackRestore(sp);
                if (e !== e + 0) throw e;
                _setThrew(1, 0);
            }
        }
        Module["UTF8ToString"] = UTF8ToString;
        Module["stringToUTF8"] = stringToUTF8;
        Module["lengthBytesUTF8"] = lengthBytesUTF8;
        Module["ALLOC_NORMAL"] = ALLOC_NORMAL;
        Module["allocate"] = allocate;
        var calledRun;
        dependenciesFulfilled = function runCaller() {
            if (!calledRun) run();
            if (!calledRun) dependenciesFulfilled = runCaller;
        };
        function run(args) {
            args = args || arguments_;
            if (runDependencies > 0) {
                return;
            }
            preRun();
            if (runDependencies > 0) {
                return;
            }
            function doRun() {
                if (calledRun) return;
                calledRun = true;
                Module["calledRun"] = true;
                if (ABORT) return;
                initRuntime();
                readyPromiseResolve(Module);
                if (Module["onRuntimeInitialized"])
                    Module["onRuntimeInitialized"]();
                postRun();
            }
            if (Module["setStatus"]) {
                Module["setStatus"]("Running...");
                setTimeout(function () {
                    setTimeout(function () {
                        Module["setStatus"]("");
                    }, 1);
                    doRun();
                }, 1);
            } else {
                doRun();
            }
        }
        if (Module["preInit"]) {
            if (typeof Module["preInit"] == "function")
                Module["preInit"] = [Module["preInit"]];
            while (Module["preInit"].length > 0) {
                Module["preInit"].pop()();
            }
        }
        run();

        return EmulatorModule.ready;
    };
})();
if (typeof exports === "object" && typeof module === "object")
    module.exports = EmulatorModule;
else if (typeof define === "function" && define["amd"])
    define([], function () {
        return EmulatorModule;
    });
else if (typeof exports === "object")
    exports["EmulatorModule"] = EmulatorModule;
