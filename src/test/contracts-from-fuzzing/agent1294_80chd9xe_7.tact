struct Varied {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract DifferentTypes {
    field: Varied;

    init() {
        self.field = Varied{
            a:42, b:false, c:"hi", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress()
        };
    }
}
