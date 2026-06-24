struct ManyPrimitives {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    t: String;
}

contract ManyPrimitivesTest {
    val: ManyPrimitives;

    init() {
        self.val = ManyPrimitives{
            i: 42,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            t: "hello"
        };
    }
}