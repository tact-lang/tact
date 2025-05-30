contract DebugEmit {
    receive() {
         dump(emit("msg".asComment()));
    }
}
