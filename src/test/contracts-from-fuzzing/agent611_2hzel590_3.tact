struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract OptionalNested {
    opt: OptionalInner;

    init() {
        self.opt = OptionalInner{
            foo: null,
            bar: true
        };
    }
}