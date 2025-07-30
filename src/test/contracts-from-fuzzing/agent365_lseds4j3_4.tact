struct Inner {
    flag: Bool;
    count: Int?;
}

contract OptionalInStruct {
    nested: Inner;

    init() {
        self.nested = Inner{ flag: false, count: null };
    }
}