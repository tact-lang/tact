struct Deep {
    val1: Int;
    val2: String;
    val3: Bool?;
    val4: Address;
    val5: Slice;
    val6: Cell;
}

contract Test {
    f1: Deep;
    f2: Deep;
    f3: Deep;

    init() {
        self.f1 = Deep{val1: 1, val2: "hi", val3: true, val4: myAddress(), val5: emptyCell().asSlice(), val6: emptyCell()};
        self.f2 = Deep{val1: 2, val2: "yo", val3: null, val4: myAddress(), val5: emptyCell().asSlice(), val6: emptyCell()};
        self.f3 = Deep{val1: 3, val2: "sup", val3: false, val4: myAddress(), val5: emptyCell().asSlice(), val6: emptyCell()};
    }
}