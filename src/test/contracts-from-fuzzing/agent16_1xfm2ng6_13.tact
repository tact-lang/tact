contract DebugVoidTest {
    receive() {
         dump(emit("test".asComment()));
    }
}
