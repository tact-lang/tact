struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Int?;
    f6: Bool?;
    f7: Address?;
    f8: String;
    f9: Int;
    f10: Bool;
}

contract LargeStorage {
    val: LargeStruct;

    init() {
        self.val = LargeStruct{
            f1: 1, f2: false, f3: myAddress(), f4: "a",
            f5: null, f6: null, f7: null, f8: "b",
            f9: 9, f10: true
        };
    }
}