struct ManyTypes {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Cell;
    f6: Builder;
    f7: Address;
}

contract TestContract {
    mt: ManyTypes;

    init() {
        self.mt = ManyTypes{
            f1: 1,
            f2: true,
            f3: "s",
            f4: emptyCell().asSlice(),
            f5: emptyCell(),
            f6: beginCell(),
            f7: myAddress()
        };
    }
}