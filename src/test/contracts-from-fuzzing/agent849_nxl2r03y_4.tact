struct MultiFields {
    int1: Int as uint8;
    int2: Int as int16;
    bool1: Bool;
    bool2: Bool;
    str1: String;
    str2: String;
    cell1: Cell;
    cell2: Cell;
    sb1: Slice;
    sb2: Slice;
    flag: Bool;
}

contract TestContract {
    data: MultiFields;

    init() {
        self.data = MultiFields{
            int1: 1,
            int2: -123,
            bool1: true,
            bool2: false,
            str1: "abc",
            str2: "def",
            cell1: emptyCell(),
            cell2: emptyCell(),
            sb1: emptyCell().asSlice(),
            sb2: emptyCell().asSlice(),
            flag: true
        };
    }
}