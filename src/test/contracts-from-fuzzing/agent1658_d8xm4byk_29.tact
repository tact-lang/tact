struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
}

contract StorageTest {
    s: S;

    init() {
        self.s = S{
            a:1,
            b:true,
            c:"hi",
            d:myAddress(),
            e:emptyCell().asSlice(),
            f:emptyCell()
        };
    }
}