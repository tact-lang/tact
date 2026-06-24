struct Nested { a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice; g: Int?; h: Bool?; i: String?; j: Address?; k: Cell?; l: Slice?; }

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{
            a: 1,
            b: true,
            c: "test",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}