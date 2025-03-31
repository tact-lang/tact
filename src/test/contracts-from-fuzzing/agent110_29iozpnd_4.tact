contract D(param: Int) {
    receive() {}
}

contract TestD {
    receive() {
        let pkg = initOf D(123);
    }
}
