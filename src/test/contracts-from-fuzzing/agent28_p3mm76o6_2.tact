struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Address;
    k: Int;
    l: Bool;
}

contract ManyFieldsTest {
    val: ManyFields;

    init() {
        self.val = ManyFields{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "test",
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: beginCell(),
            j: myAddress(),
            k: -1,
            l: false
        };
    }
}