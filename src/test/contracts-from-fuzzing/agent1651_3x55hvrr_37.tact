struct Fields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Builder;
    f6: Slice;
    f7: Address;
}

contract Test37 {
    val: Fields;

    init() {
        self.val = Fields{
            f1:0,
            f2:true,
            f3:"str",
            f4: emptyCell(),
            f5: beginCell(),
            f6: emptyCell().asSlice(),
            f7: myAddress()
        };
    }
}
