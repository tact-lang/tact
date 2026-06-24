struct BigStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: Slice?;
    k: String?;
}

contract ManyTypes {
    val: BigStruct;

    init() {
        self.val = BigStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
        };
    }
}