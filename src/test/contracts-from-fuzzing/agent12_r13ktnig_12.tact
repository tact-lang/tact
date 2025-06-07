contract TestContract {
    receive() {
        dump(emit("msg".asComment()));
    }
}
