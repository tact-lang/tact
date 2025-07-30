contract LargeContract {
    int1: Int as int1;
    int8: Int as int8;
    int16: Int as int16;
    int32: Int as int32;
    int64: Int as int64;
    int128: Int as int128;
    int256: Int as int256;
    uint1: Int as uint1;
    uint8: Int as uint8;
    uint16: Int as uint16;
    uint32: Int as uint32;
    uint64: Int as uint64;
    uint128: Int as uint128;
    uint256: Int as uint256;
    flag: Bool;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
    optionalInt: Int?;
    optionalAddress: Address?;
    optionalCell: Cell?;
    optionalSlice: Slice?;
    optionalString: String?;

    init() {
        self.int1 = 0;
        self.int8 = 0;
        self.int16 = 0;
        self.int32 = 0;
        self.int64 = 0;
        self.int128 = 0;
        self.int256 = 0;
        self.uint1 = 0;
        self.uint8 = 0;
        self.uint16 = 0;
        self.uint32 = 0;
        self.uint64 = 0;
        self.uint128 = 0;
        self.uint256 = 0;
        self.flag = false;
        self.addressField = myAddress();
        self.cellField = emptyCell();
        self.sliceField = self.cellField.asSlice();
        self.stringField = "test";
        self.optionalInt = null;
        self.optionalAddress = null;
        self.optionalCell = null;
        self.optionalSlice = null;
        self.optionalString = null;
    }
}