struct OutOfOrder {
    b: Bool;
    a: Int;
    c: String;
}

contract UnorderedFields {
    st: OutOfOrder;

    init() {
        self.st = OutOfOrder{
            b: false,
            a: 123,
            c: "ordered"
        };
    }
}