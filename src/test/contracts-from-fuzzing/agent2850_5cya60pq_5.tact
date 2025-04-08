struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int;
    f6: Bool;
    f7: String;
    f8: Address;
    f9: Int;
    f10: Bool;
    f11: String;
    f12: Address;
}

contract LongStructContract {
    val: LongStruct;

    init() {
        self.val = LongStruct{
            f1: 1, f2: true, f3: "A", f4: myAddress(),
            f5: 2, f6: false, f7: "B", f8: myAddress(),
            f9: 3, f10: true, f11: "C", f12: myAddress()
        };
    }
}