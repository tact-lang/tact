struct S1 {
    a: Int;
}

struct S2 {
    b: String;
    c: S1;
}

contract StructInStruct {
    f: S2;

    init() {
        self.f = S2{ b: "hi", c: S1{a: 3} };
    }
}