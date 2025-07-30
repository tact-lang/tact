struct BigStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Address;
}

contract TestContract {
    data: BigStruct;
    
    init() {
        self.data = BigStruct{
            a: 1,
            b: null,
            c: true,
            d: "abc",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: myAddress(),
        };
    }
}