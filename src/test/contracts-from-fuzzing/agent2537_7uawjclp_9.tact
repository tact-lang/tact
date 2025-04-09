struct LargeStruct {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Bool;
    x7: Bool;
    x8: Bool;
    x9: String;
    x10: String;
    x11: Address;
    x12: Cell;
    x13: Bool?;
    x14: Int?;
}

contract LargeStructStore {
    data: LargeStruct;
    init() {
        self.data = LargeStruct{
            x1: 1, x2: 2, x3: 3, x4: 4, x5: 5,
            x6: true, x7: false, x8: true,
            x9: "str1", x10: "str2",
            x11: myAddress(), x12: emptyCell(),
            x13: null, x14: null
        };
    }
}