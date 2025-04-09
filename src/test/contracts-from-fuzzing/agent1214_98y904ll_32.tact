struct OutOfOrder {
    b: Int;
    a: Int;
    d: String;
    c: Bool;
}

contract Test32 {
    fields: OutOfOrder;
    init() {
        self.fields = OutOfOrder{
            b: 2,
            a: 1,
            d: "hi",
            c: true,
        };
    }
}