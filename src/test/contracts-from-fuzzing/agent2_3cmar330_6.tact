contract TestContract {
    receive() {
        let x: Int = true ? (false ? 3 : 4) : 2;
    }
}