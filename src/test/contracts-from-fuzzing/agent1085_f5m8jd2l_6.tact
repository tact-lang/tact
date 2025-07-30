struct OptionalNested {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Cell?;
    f5: Address?;
}

contract OptionalNestedTest {
    x: OptionalNested;
    y: OptionalNested?;

    init() {
        self.x = OptionalNested{
            f1: 1,
            f2: false,
            f3: "hello",
            f4: emptyCell(),
            f5: myAddress()
        };

        self.y = OptionalNested{
            f1: null,
            f2: true,
            f3: null,
            f4: null,
            f5: myAddress()
        };
    }
}