struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{a:1, b:true, c:"hi", d:myAddress(), e:emptyCell().asSlice(), f:emptyCell()};
    }
}