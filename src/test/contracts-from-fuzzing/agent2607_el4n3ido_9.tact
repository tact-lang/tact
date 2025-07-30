struct NestedOptStruct {
    foo: Int;
    opt: S?;
}

struct S {
    inner: Int;
}

contract NestedOptVar {
    data: NestedOptStruct;

    init() {
        self.data = NestedOptStruct{
            foo: 5,
            opt: null
        };
    }
}
