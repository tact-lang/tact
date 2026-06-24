contract DebugTestVoid {
    receive() {
         dump(emit("test message".asComment()));
    }
}
