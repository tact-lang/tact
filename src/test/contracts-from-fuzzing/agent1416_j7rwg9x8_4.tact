struct ManyTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: String;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: String?;
}

contract VariedStorage {
    data: ManyTypes;
    init() {
        self.data = ManyTypes{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: "hello",
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: null,
            j: null,
            k: null
        };
    }
}