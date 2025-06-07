struct Inner {
    y: Int?;
    z: Int;
}

struct HasOptionalNested {
    x: Int?;
    nested: Inner;
}

contract DeepOptionals {
    s: HasOptionalNested;

    init() {
        self.s = HasOptionalNested{
            x: null,
            nested: Inner{ y: null, z: 5 }
        };
    }
}