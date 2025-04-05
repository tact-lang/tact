contract TestLetOk {
    receive() {
        let y = 42;
        dump(y);
    }
}
