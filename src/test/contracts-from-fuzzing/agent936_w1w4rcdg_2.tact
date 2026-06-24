struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Address?;
}

contract ManyFields {
    store: Deep;

    init() {
        self.store = Deep{
            a: 1, b: true, c: "hi", d: emptyCell(), e: emptyCell().asSlice(), f: myAddress(),
            g: 2, h: false, i: "bye", j: emptyCell(), k: emptyCell().asSlice(), l: myAddress()
        };
    }

    receive() {
        let _ = self.store.a;
    }
}