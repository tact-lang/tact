contract TestDumpVoid {
    receive() {
         dump(emit("msg".asComment()));
    }
}
