struct NestedArraysSupport {
    a: Int;
    b: Bool;
}

contract MultiInitializer {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: NestedArraysSupport;

    init() {
        self.f1 = 10;
        self.f2 = true;
        self.f3 = "bye";
        self.f4 = myAddress();
        self.f5 = NestedArraysSupport{ a: 100, b: false };
    }
}
