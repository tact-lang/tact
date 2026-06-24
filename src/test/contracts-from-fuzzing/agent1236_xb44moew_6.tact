struct S { a: Int; b: Bool; c: String; d: Slice; e: Address; f: Cell; g: Int?; h: Bool?; i: Address?; j: Cell?; }

contract Test {
    data: S;
    init() {
        self.data = S{
            a:0,
            b:true,
            c:"x",
            d: emptyCell().asSlice(),
            e: myAddress(),
            f: emptyCell(),
            g: null,
            h: false,
            i: null,
            j: null
        };
    }
}