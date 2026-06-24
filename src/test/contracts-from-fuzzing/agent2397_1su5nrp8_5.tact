struct BigFields {
    a: Int; b: Bool; c: String; d: Cell; e: Slice; f: Address; g: Int?; h: Bool?; i: String; j: Int;
}

contract ManyFields {
    big: BigFields;
    init() {
        self.big = BigFields{
            a: 1, b: true, c: "c", d: emptyCell(), e: emptyCell().asSlice(), f: myAddress(),
            g: null, h: false, i: "i", j: 10
        };
    }
    receive() {}
}