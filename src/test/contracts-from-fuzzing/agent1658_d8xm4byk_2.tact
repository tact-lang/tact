struct ManyPrimitives {
    i: Int;
    b: Bool;
    addr: Address;
    c1: Cell;
    s1: Slice;
    str: String;
}

contract StorageTest {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            i: 123,
            b: true,
            addr: myAddress(),
            c1: emptyCell(),
            s1: emptyCell().asSlice(),
            str: "hello"
        };
    }
}
