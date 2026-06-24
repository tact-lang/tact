struct S1 {
    a: Int;
    b: String?;
}

struct S2 {
    x: Bool;
    y: S1;
    z: S1?;
}

contract NestedOptionalStruct {
    f: S2;

    init() {
        self.f = S2{
            x: true,
            y: S1{ a:1, b:null },
            z: null
        };
    }
}