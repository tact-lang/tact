contract TestContract {
    receive() {
        let x: Int = 42;
        dump(x);
    }
}