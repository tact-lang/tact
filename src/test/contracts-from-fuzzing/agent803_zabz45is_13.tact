struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    o: Int?;
}

contract MixedFields {
    data: Mixed;

    init() {
        self.data = Mixed{
            i: 5,
            b: true,
            s: "x",
            c: emptyCell(),
            a: myAddress(),
            o: null
        };
    }
}