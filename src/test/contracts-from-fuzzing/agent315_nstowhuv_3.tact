struct ManyFields {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    int6: Int;
    bool1: Bool;
    bool2: Bool;
    addr1: Address;
    addr2: Address;
    str1: String;
    str2: String;
    cell1: Cell;
    cell2: Cell;
}

contract ManyFieldsContract {
    sf: ManyFields;

    init() {
        self.sf = ManyFields{
            int1: 1, int2: 2, int3: 3, int4: 4, int5: 5, int6: 6,
            bool1: true, bool2: false,
            addr1: myAddress(), addr2: myAddress(),
            str1: "a", str2: "b",
            cell1: emptyCell(), cell2: emptyCell(),
        };
    }
}