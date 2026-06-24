struct Mixed {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
}

contract MixedFieldsTest {
    val: Mixed;

    init() {
        self.val = Mixed{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "abc",
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: null,
            k: emptyCell().asSlice(),
            l: null
        };
    }

    receive() {
        let _ = self.val;
    }
}