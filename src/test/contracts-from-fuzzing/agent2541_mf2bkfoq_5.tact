struct Nested {
    intField: Int;
}

contract TestContract {
    arr0: Int;
    arr1: Bool;
    arr2: String;
    arr3: Cell;
    arr4: Slice;
    arr5: Address;
    arr6: Int?;
    arr7: Bool?;
    arr8: String?;
    arr9: Cell?;
    arr10: Slice?;
    arr11: Address?;
    arr12: Nested;

    init() {
        self.arr0 = 0;
        self.arr1 = false;
        self.arr2 = "";
        self.arr3 = emptyCell();
        self.arr4 = emptyCell().asSlice();
        self.arr5 = myAddress();
        self.arr6 = null;
        self.arr7 = null;
        self.arr8 = null;
        self.arr9 = null;
        self.arr10 = null;
        self.arr11 = null;
        self.arr12 = Nested{ intField: 0 };
    }
}