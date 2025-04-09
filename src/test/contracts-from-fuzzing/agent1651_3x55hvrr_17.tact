struct STypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
}

contract Test17 {
    val: STypes;

    init() {
        self.val = STypes{
            i:1, b:false, s:"hi",
            c: emptyCell(), sl: emptyCell().asSlice(),
            bu: beginCell(), a: myAddress()
        };
    }
}
