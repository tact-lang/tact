struct S1 {
    foo: Int;
    bar: Bool?;
}

struct S2 {
    inner: S1?;
    baz: String;
}

contract NestedOptionalStruct {
    value: S2;

    init() {
        self.value = S2{
            inner: null,
            baz: "hey"
        };
    }
}