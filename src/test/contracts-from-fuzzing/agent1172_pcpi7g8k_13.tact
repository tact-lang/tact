struct Ordered {
    first: Int as int8;
    second: Int as uint4;
    third: Bool;
    fourth: String;
    fifth: Cell;
}

contract SerializationOrder {
    s: Ordered;

    init() {
        self.s = Ordered{
            first: -5,
            second: 10,
            third: true,
            fourth: "test",
            fifth: emptyCell()
        };
    }
}