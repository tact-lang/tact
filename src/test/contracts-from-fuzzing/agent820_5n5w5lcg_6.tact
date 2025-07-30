struct HasOptionalNested {
    nested: OptionalInner?;
}

struct OptionalInner {
    x: Int;
    y: Bool;
}

contract TestContract {
    opt: HasOptionalNested;
    init() {
        self.opt = HasOptionalNested{
            nested: OptionalInner{
                x: 5,
                y: false,
            },
        };
    }
}