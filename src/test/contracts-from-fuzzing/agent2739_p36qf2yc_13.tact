contract MultipleStructs {
    s1: Struct1;
    s2: Struct2;
    init() {
        self.s1 = Struct1{ x: 5, y: false };
        self.s2 = Struct2{ s: "hi", a: myAddress() };
    }
}

struct Struct1 {
    x: Int;
    y: Bool;
}

struct Struct2 {
    s: String;
    a: Address;
}