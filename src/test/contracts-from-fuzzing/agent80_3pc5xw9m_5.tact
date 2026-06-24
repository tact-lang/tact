struct BigStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: String;
    f: Bool?;
    g: Address?;
    h: String?;
    i: Int?;
    j: Cell?;
}

contract VariedFieldsStorage {
    data: BigStruct;
    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: emptyCell(),
            d: myAddress(),
            e: "hello",
            f: false,
            g: null,
            h: null,
            i: 42,
            j: null
        };
    }
}