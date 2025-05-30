struct NestedOpt {
    foo: Int;
    bar: String?;
}

contract OptionalInside {
    data: NestedOpt?;
    other: Bool;

    init() {
        self.data = NestedOpt{
            foo: 123,
            bar: "hi"
        };
        self.other = true;
    }
}