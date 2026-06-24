struct StructX {
    x: Int;
    opt: Int?;
}

struct StructY {
    y: Bool;
    nested: StructX;
}

contract MixedOptionals {
    s: StructY;

    init() {
        self.s = StructY{
            y: true,
            nested: StructX{
                x: 10,
                opt: null
            }
        };
    }
}