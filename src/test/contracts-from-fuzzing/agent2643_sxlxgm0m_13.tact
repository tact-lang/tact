struct S1 {
    x: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

contract NestedMultiStruct {
    data: S2;

    init() {
        self.data = S2{
            s1a: S1{ x: 10 },
            s1b: S1{ x: 20 }
        };
    }
}
