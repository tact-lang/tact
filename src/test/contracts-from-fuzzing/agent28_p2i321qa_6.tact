contract TestAddition {
    receive() {
        let a: Int = 1 + 2; // binary addition
        dump(a);
    }
}
