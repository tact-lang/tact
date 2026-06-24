struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Bool;
    f7: Bool?;
    f8: String;
    f9: Cell;
    f10: Address;
}

contract TestContract {
    storage: ManyFields;
    init() {
        self.storage = ManyFields{
            f1: 1, f2: 2, f3: 3, f4: 4, f5: 5, f6: true, f7: null,
            f8: "hello", f9: emptyCell(), f10: myAddress()
        };
    }
}
