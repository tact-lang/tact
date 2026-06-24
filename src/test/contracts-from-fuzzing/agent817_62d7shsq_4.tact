struct Wide {
    a1: Int; a2: Int; a3: Int;
    a4: Bool; a5: Bool; a6: Bool;
    a7: Slice; a8: Cell; a9: String;
    a10: Int?; a11: Bool?; a12: String?; a13: Address?;
}

contract TestWide {
    s: Wide;

    init() {
        self.s = Wide{
            a1: 1, a2: 2, a3: 3,
            a4: true, a5: false, a6: true,
            a7: emptyCell().asSlice(),
            a8: emptyCell(),
            a9: "hi",
            a10: 10,
            a11: null,
            a12: null,
            a13: null,
        };
    }
}