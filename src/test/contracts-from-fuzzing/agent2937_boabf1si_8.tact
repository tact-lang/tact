struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: DeepInner?;
}

struct DeepInner {
    x: Int;
    y: Bool;
}

contract TestOptionalNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            a: null,
            b: null,
            c: null,
            d: DeepInner{
                x: 100,
                y: false
            }
        };
    }
}