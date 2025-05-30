struct Wide {
    a: Int; b: Int; c: Bool; d: String; e: Slice; f: Cell; g: Address;
    h: Int?; i: Bool?; j: String?; k: Slice?; l: Cell?; m: Address?;
}

contract WideStructStorage {
    data: Wide;

    init() {
        self.data = Wide{
          a: 1, b: 2, c: true, d: "s", e: emptyCell().asSlice(), f: emptyCell(), g: myAddress(),
          h: null, i: null, j: null, k: null, l: null, m: null
        };
    }
}