struct Wide {
    a: Int; b: Bool?; c: String; d: Cell?; e: Int?; f: Bool; g: String?; h: Cell;
    i: Slice?; j: Int; k: Bool?; l: Slice; m: String?; n: Int; o: Bool;
}

contract WideNestStruct {
    data: Wide;

    init() {
        self.data = Wide{
            a: 1, b: true, c: "abc", d: null, e: null, f: false,
            g: null, h: emptyCell(), i: null, j: 2, k: null, l: emptyCell().asSlice(),
            m: null, n: 3, o: true
        };
    }
}