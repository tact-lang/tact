struct OptionalPrimitives {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract ManyOptionals {
    state: OptionalPrimitives;

    init() {
        self.state = OptionalPrimitives{
            a: -1,
            b: true,
            c: myAddress(),
            d: "hi",
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}