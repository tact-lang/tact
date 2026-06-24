struct BigMixedStruct {
    a: Int;
    b: Bool?;
    c: Address?;
    d: Cell;
    e: Slice?;
    f: String;
    g: Bool;
    h: Int?;
    i: String?;
    j: Cell?;
    k: Address;
    l: Slice;
}

contract BigMix {
    storage: BigMixedStruct;

    init() {
        self.storage = BigMixedStruct{
            a: 1, 
            b: null,
            c: null,
            d: emptyCell(),
            e: null,
            f: "test",
            g: true,
            h: null,
            i: "maybe",
            j: null,
            k: myAddress(),
            l: emptyCell().asSlice()
        };
    }
}