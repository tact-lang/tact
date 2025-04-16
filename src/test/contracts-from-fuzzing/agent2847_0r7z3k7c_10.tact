struct InnerNested {
    x: Int;
    y: Bool;
}

struct OuterOptional {
    p: Int;
    q: Bool;
    nested: InnerNested?;
}

contract OptionInsideStruct {
    s: OuterOptional;

    init() {
        self.s = OuterOptional{
            p: 12,
            q: false,
            nested: InnerNested{
                x: 4,
                y: true,
            },
        };
    }
}