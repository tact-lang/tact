struct ManyConsts {
    a: Int;
    b: Int = 5;
    c: String = "hi";
    d: Bool = true;
    e: Address;
    f: Cell;
    g: Slice;
}

contract TestContract {
    val: ManyConsts;

    init() {
        self.val = ManyConsts{
            a: 1,
            e: myAddress(),
            f: emptyCell(),
            g: emptyCell().asSlice()
        };
    }
}