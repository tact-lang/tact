struct Params { a: Int; b: Bool; c: Address; d: String; e: Cell; f: Slice; g: Builder }

contract WideFields {
    s: Params;

    init() {
        self.s = Params{
            a: 1, b: true, c: myAddress(), d: "hi", e: emptyCell(), f: emptyCell().asSlice(), g: beginCell()
        };
    }
}