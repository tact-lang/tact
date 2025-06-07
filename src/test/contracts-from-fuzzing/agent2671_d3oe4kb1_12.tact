struct ShortOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    x: ShortOpt?;
    y: Int;
}

contract OptionalStructs {
    foo: OuterOpt;

    init() {
        self.foo = OuterOpt{
            x: null,
            y: 10
        };
    }
}