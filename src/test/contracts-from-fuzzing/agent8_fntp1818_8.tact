contract TestEmit {
    receive() {
        dump(emit("msg".asComment()));
    }
}
