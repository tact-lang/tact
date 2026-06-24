contract TestContract {
    receive() {
        let a: Int = 10;
        a = a + 5;
        dump(a);
    }
}
