struct OptionalNested {
    nxt: InnerNested?;
}

struct InnerNested {
    x: Int;
    y: Bool;
    z: Int?;
}

contract ComplexOptional {
    state: OptionalNested;
    init() {
        self.state = OptionalNested{
            nxt: InnerNested{
                x: 5,
                y: true,
                z: null
            }
        };
    }
}