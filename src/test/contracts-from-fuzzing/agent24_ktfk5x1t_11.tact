struct Nested {
    sub: Int
}

struct ComplexStruct {
    f1: Int;
    f2: Int?;
    f3: map<Int, Int>;
    f4: Nested?;
    f5: Int
}

contract TestComplexStruct {
    receive() {
        let cs: ComplexStruct = ComplexStruct {
            f1: 100,
            f2: null,
            f3: emptyMap(),
            f4: null,
            f5: 200
        };
        let _ = cs.f1 + cs.f5;
        return;
    }
}
