contract TestContract {
    x: Int;
    y: Bool;
    s: String;
    a: Address;
    o: Int?;

    init() {
        self.x = 10;
        self.y = true;
        self.s = "hello";
        self.a = myAddress();
        self.o = null;
    }
}
