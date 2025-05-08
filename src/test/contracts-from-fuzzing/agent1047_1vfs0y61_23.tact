struct Combined {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Slice;
    f: Builder?;
}

contract Test {
    f: Combined;

    init() {
        self.f = Combined{
            a: 10,
            b: null,
            c: "abc",
            d: null,
            e: emptyCell().asSlice(),
            f: null
        };
    }
}