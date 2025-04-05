contract TestLiterals {
    receive() {
        let i: Int = 42;
        let b: Bool = false;
        let s: String = "Tact";
        let addr: Address = newAddress(0, 0);
        dump(i);
    }
}
