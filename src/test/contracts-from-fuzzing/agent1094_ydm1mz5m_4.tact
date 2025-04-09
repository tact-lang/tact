struct Complex {
    i: Int;
    s: String;
    b: Bool;
    addr: Address;
    c: Cell;
    sl: Slice;
}

contract StorageTest {
    val: Complex;
    init() {
        self.val = Complex{
            i: 7,
            s: "hello",
            b: true,
            addr: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}