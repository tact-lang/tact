contract DefaultsCombinations {
    i: Int = 123;
    b: Bool;
    s: String = "hey";
    o: Address;

    init() {
        self.b = false;
        self.o = myAddress();
    }
}
