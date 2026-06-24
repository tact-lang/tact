struct LongStruct {
    a: Int; b: Bool; c: Int?; d: String; e: Address; f: Cell; g: Slice; h: Int;
    i: Bool; j: Int?; k: String; l: Address; m: Cell; n: Slice; o: Int;
    p: Bool; q: Int?; r: String; s: Address; t: Cell; u: Slice; v: Int;
}

contract ManyFields {
    storage: LongStruct;

    init() {
        self.storage = LongStruct{
            a: 1, b: false, c: null, d: "a", e: myAddress(), f: emptyCell(), g: emptyCell().asSlice(), h: 2,
            i: true, j: null, k: "b", l: myAddress(), m: emptyCell(), n: emptyCell().asSlice(), o: 3,
            p: false, q: null, r: "c", s: myAddress(), t: emptyCell(), u: emptyCell().asSlice(), v: 4
        };
    }
}