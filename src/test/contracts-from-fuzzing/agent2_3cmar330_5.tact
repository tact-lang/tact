contract TestContract {
    receive() {
        let x: Int = (true && false) ? 1 : 2;
    }
}