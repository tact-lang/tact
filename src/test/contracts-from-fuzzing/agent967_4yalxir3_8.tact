struct Mix {
    a: Int;
    b: Bool?;
    c: Cell;
    d: Address?;
    e: String;
    f: Slice?;
}

contract MixedStructTest {
    storage: Mix;

    init() {
        self.storage = Mix{
            a: 7,
            b: true,
            c: emptyCell(),
            d: null,
            e: "xyz",
            f: null
        };
    }
}