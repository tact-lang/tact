struct S1 {
    val: Int;
}

struct S2 {
    inner: S1;
}

contract NestedOptionalStruct {
    f: S2?;

    init() {
        self.f = S2{inner: S1{val: 123}};
    }
}