struct BigFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
}

contract ManyTypesTest {
    data: BigFields;

    init() {
        self.data = BigFields{
            a: 1,
            b: false,
            c: myAddress(),
            d: "hi",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: true
        };
    }
}
