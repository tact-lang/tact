struct BigNestedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
}

struct NestedOuter {
    x: BigNestedOptionals?;
    y: Bool?;
}

contract LotsOptionals {
    big: NestedOuter?;

    init() {
        self.big = NestedOuter{
            x: BigNestedOptionals{ a:7, b:"hi", c:false, d:42 },
            y: true
        };
    }
}