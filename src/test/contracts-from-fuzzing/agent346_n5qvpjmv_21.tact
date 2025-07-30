struct VariousPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
}

contract StructPrimitive {
    d: VariousPrimitives;
    init() {
        self.d = VariousPrimitives{
            i: 1,
            b: true,
            s: "hi",
            a: myAddress(),
            c: emptyCell()
        };
    }
}