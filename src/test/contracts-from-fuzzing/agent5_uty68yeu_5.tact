struct MixedFieldStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: String;
    l: String?;
}

contract MixedStructStorage {
    storage: MixedFieldStruct;

    init() {
        self.storage = MixedFieldStruct{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: myAddress(),
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: "hello",
            l: null
        };
    }
}