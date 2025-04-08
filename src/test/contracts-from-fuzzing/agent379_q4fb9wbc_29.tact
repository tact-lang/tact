struct Inner {
    value: Int?;
}

contract OptionalInsideStruct {
    a: Inner;

    init() {
        self.a = Inner{ value: null };
    }
}