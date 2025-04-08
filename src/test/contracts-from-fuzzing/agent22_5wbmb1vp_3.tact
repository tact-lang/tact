struct ManyPrimitives {
    x: Int;
    y: Bool;
    z: String;
    addr: Address;
    cl: Cell;
    sl: Slice;
}

contract TestContract {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            x: 5,
            y: true,
            z: "hi",
            addr: myAddress(),
            cl: emptyCell(),
            sl: emptyCell().asSlice(),
        };
    }
}