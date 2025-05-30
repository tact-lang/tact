struct BigStruct {
    a: Int; 
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int;
    g: Bool;
    h: String;
    i: Cell;
    j: Address;
}

contract WideTest {
    payload: BigStruct;

    init() {
        self.payload = BigStruct{
            a: 1,
            b: true,
            c: "c",
            d: emptyCell(),
            e: myAddress(),
            f: 2,
            g: false,
            h: "h",
            i: emptyCell(),
            j: myAddress()
        };
    }
}
