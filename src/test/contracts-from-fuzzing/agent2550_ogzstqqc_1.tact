struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Builder?;
    m: Address?;
}

contract TestContract {
    state: BigStruct;

    init() {
        self.state = BigStruct{
            a: 1,
            b: true,
            c: "str",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: null
        };
    }
}