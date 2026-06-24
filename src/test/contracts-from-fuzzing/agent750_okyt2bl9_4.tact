struct ManyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
}

contract MixedFields {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            i: 10,
            b: true,
            s: "hello",
            a: myAddress(),
            c: emptyCell(),
        };
    }
}
