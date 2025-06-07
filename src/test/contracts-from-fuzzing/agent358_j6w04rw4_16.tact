struct WeirdOrder {
    b: Bool;
    x: Int;
    y: Int;
    s: String;
    o: Int?;
}

contract OrderMatters {
    foo: WeirdOrder;

    init() {
        self.foo = WeirdOrder{
            b: false,
            x: 1,
            y: 2,
            s: "hi",
            o: null
        };
    }
}