contract TestInvalidInput {
    receive() {
        dump(emit("msg".asComment()));
    }
}
