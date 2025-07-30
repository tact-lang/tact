message(0x1) M1 {
    a: Int;
    b: Bool;
}

message(0x2) M2 {
    x: String;
    y: Address;
}

contract MessageStorage {
    m1: M1;
    m2: M2;

    init() {
        self.m1 = M1{ a: 1, b: true };
        self.m2 = M2{ x: "hi", y: myAddress() };
    }
}
