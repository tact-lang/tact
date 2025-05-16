struct ManyTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract Test {
    mt: ManyTypes;

    init() {
        self.mt = ManyTypes{ a:1, b:true, c:myAddress(), d:emptyCell(), e:emptyCell().asSlice(), f:"s" };
    }
}