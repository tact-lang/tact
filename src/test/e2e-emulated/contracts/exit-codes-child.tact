contract ExitCodesChild {
    receive() {}
    get fun test() {
        require(false, "second");
        return;
    }
}
