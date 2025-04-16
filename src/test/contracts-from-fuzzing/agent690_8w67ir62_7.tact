struct Mix {
    i: Int;
    o: Int?;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;
}

contract MixedFields {
    data: Mix;

    init() {
        self.data = Mix{
            i: 1,
            o: null,
            b: true,
            s: "hello",
            c: emptyCell(),
            addr: myAddress(),
        };
    }
}