contract TestContract {
    arr0: Int as uint8;
    arr1: Int as uint16;
    arr2: Int as uint32;
    arr3: Int as uint64;
    arr4: Int as uint128;
    arr5: Int as uint256;
    arr6: Int as int8;
    arr7: Int as int16;
    arr8: Int as int32;
    arr9: Int as int64;
    arr10: Int as int128;
    arr11: Int as int256;

    init() {
        self.arr0 = 1;
        self.arr1 = 2;
        self.arr2 = 3;
        self.arr3 = 4;
        self.arr4 = 5;
        self.arr5 = 6;
        self.arr6 = -1;
        self.arr7 = -2;
        self.arr8 = -3;
        self.arr9 = -4;
        self.arr10 = -5;
        self.arr11 = -6;
    }
}