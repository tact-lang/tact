struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    c: String;
}

contract OptionalNestedStruct {
    f: S2?;

    init() {
        self.f = S2{
            s1: S1{ a: 1, b: false },
            c: "hello"
        };
    }
}