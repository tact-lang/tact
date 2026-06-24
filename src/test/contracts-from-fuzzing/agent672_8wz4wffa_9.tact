struct Mix {
    a: Int; b: Bool; c: Slice; d: Cell; e: Address;
    f: Int?; g: Bool?; h: Slice?; i: Cell?; j: Address?;
}

contract MixedFields {
    data: Mix;

    init() {
        self.data = Mix{
            a: 1, b: true, c: emptyCell().asSlice(), d: emptyCell(), e: myAddress(),
            f: null, g: null, h: null, i: null, j: null
        };
    }
}