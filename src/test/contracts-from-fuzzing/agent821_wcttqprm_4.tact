// test deferred init assignment instead of initializer
struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Int?;
    f7: Bool?;
    f8: String?;
    f9: Cell;
    f10: Address;
}

contract TestLargeStruct {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 2, f2: false, f3: "y", f4: emptyCell(), f5: myAddress(),
            f6: 3, f7: true, f8: "abc", f9: emptyCell(), f10: myAddress()
        };
    }
}
