struct Mix {
    a: Int;
    b: Bool;
    c: Bool?;
    d: String;
    e: String?;
    f: Cell;
    g: Cell?;
    h: Slice;
    i: Slice?;
    j: Address;
    k: Address?;
}

contract MixedStorage {
    data: Mix;

    init() {
        self.data = Mix{
            a: 1,
            b: false,
            c: null,
            d: "hi",
            e: null,
            f: emptyCell(),
            g: null,
            h: emptyCell().asSlice(),
            i: null,
            j: myAddress(),
            k: null,
        };
    }
}