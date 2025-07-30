struct OutOfOrderFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract AssignDifferentOrder {
    x: OutOfOrderFields;
    init() {
        self.x = OutOfOrderFields{
            e:5,
            d:4,
            c:3,
            b:2,
            a:1
        };
    }
}