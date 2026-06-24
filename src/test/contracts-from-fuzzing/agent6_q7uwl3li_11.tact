contract TestInvalid {
    receive() {
        dump(emit("msg".asComment()));
    }
}
