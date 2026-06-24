// Large nested struct, mix optional and plain, multiple types
struct Z {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Int?;
    g: String?;
    h: Bool?;
    i: Address?;
    j: Cell?;
}

contract Test {
    z: Z;

    init() {
        self.z = Z{
            a: 1,
            b: "b",
            c: true,
            d: myAddress(),
            e: emptyCell(),
            f: null,
            g: null,
            h: null,
            i: null,
            j: null
        };
    }
}