struct S10 { a: Int; b: Bool; c: String; d: Address; e: Int?; f: Bool?; g: String?; h: Slice; i: Cell; j: Cell?; }

contract LargeStructTest {
    storage: S10;

    init() {
        self.storage = S10{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: null,
            f: null,
            g: null,
            h: emptyCell().asSlice(),
            i: emptyCell(),
            j: null
        };
    }
}