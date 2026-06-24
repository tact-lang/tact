struct Multi {
    int1: Int;
    bool1: Bool;
    string1: String;
    cell1: Cell;
    slice1: Slice;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract Test6 {
    m: Multi;
    init() {
        self.m = Multi{
            int1: 1,
            bool1: false,
            string1: "test",
            cell1: emptyCell(),
            slice1: emptyCell().asSlice(),
            optInt: null,
            optBool: null,
            optString: "ok"
        };
    }
}