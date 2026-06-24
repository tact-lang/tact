struct Inner {
    a: Int?;
    b: Bool;
}

contract OptionalInStruct {
    f: Inner;

    init() {
        self.f = Inner{
            a: null,
            b: true
        };
    }
}