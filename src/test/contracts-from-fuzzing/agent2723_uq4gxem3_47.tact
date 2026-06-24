contract Prims {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    init() {
        self.a = 5;
        self.b = false;
        self.c = "hi";
        self.d = myAddress();
    }
}