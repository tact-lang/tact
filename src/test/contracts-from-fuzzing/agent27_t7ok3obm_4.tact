struct ManyFields1 {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
    g: Bool?;
    h: Int?;
    i: Cell;
    j: String?;
}

contract ManyFieldsTest {
    complex: ManyFields1;

    init() {
        self.complex = ManyFields1{
            a: 123,
            b: false,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: myAddress(),
            f: "world",
            g: true,
            h: 99,
            i: emptyCell(),
            j: "hi"
        };
    }
}
