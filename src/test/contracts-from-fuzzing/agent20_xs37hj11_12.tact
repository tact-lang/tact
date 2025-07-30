contract Test {
    receive() {
         // 'emit' doesn't return a value. It will print debug void.
         dump(emit("msg".asComment()));
    }
}
