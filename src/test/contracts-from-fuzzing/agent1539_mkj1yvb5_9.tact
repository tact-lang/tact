struct S1 {
    p: Int;
    q: Bool;
}

struct S2 {
    r: String;
    s: Address;
}

contract MultipleStructs {
    a: S1;
    b: S2;

    init() {
        self.a = S1{ p: 1, q: true };
        self.b = S2{ r: "X", s: myAddress() };
    }
}