struct NestedOptStruct {
    s: Int?;
}

contract DoubleNestedOpt {
    foo: NestedOptStruct? = null;

    init() {
        self.foo = null;
    }
}