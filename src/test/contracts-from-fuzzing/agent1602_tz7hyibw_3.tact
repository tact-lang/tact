struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Bool?;
    h: Int?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract ManyTypesTest {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: false,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: true,
            h: 42,
            i: "def",
            j: myAddress(),
            k: emptyCell(),
            l: emptyCell().asSlice(),
        };
    }
}
