struct BigPrimitiveFields {
    int1: Int;
    int2: Int;
    int3: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    str1: String;
    str2: String;
    str3: String;
    cell1: Cell;
    cell2: Cell;
    cell3: Cell;
}

contract TestContract {
    data: BigPrimitiveFields;

    init() {
        self.data = BigPrimitiveFields{
            int1: 1, int2: 2, int3: 3,
            bool1: true, bool2: false, bool3: true,
            str1: "abc", str2: "def", str3: "ghi",
            cell1: emptyCell(), cell2: emptyCell(), cell3: emptyCell()
        };
    }
}