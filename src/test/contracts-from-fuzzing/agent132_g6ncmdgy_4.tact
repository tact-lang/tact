struct ManyFields {
    a: Int;
    b: Int;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: Cell;
    g: Address;
    h: String;
    i: String?;
}

contract ManyFieldsTest {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            a: 1, b: 2, c: true, d: 4,
            e: null, f: emptyCell(), g: myAddress(),
            h: "hi", i: "opt"
        };
    }
}