struct MixedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
}

contract TestContract {
    mt: MixedTypes;

    init() {
        self.mt = MixedTypes{
            a: 1,
            b: true,
            c: "hello",
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: emptyCell(),
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}