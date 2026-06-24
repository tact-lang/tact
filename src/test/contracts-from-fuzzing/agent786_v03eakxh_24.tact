struct BigFlat {
    f1: Int; f2: Bool; f3: String; f4: Address; f5: Cell; f6: Slice;
}

contract ManyTypesInStruct {
    stuff: BigFlat;
    init() {
        self.stuff = BigFlat{
            f1: 5,
            f2: true,
            f3: "hey",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice()
        };
    }
}