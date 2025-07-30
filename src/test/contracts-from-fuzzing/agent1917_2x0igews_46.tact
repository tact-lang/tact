struct OptInner {
    value: Int?;
}

contract UninitializedOptDefault {
    foo: OptInner;

    init() {
        self.foo = OptInner{ value: null };
    }
}
