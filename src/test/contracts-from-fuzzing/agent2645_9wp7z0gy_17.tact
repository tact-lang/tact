struct SOptional {
    foo: Int?;
}

contract OptionalInStruct {
    data: SOptional;

    init() {
        self.data = SOptional{ foo: null };
    }
}
