// Struct with lots of different types
struct Variety {
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

contract VarietyHolder {
    v: Variety;

    init() {
        self.v = Variety {
            a: 1, b: null, c: true, d: null,
            e: myAddress(), f: null,
            g: emptyCell(), h: null,
            i: emptyCell().asSlice(), j: null,
            k: "hello", l: null
        };
    }
}
