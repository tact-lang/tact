struct S { a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice; g: Int?; h: Bool?; i: String?; j: Address?; }

contract MixedStructStorage {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: true,
            c: "hello",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}