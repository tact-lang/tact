struct OutOfOrder {
    c: Int;
    a: Int;
    d: Int;
    b: Int;
}

contract MessyOrder {
    x: OutOfOrder;

    init() {
        self.x = OutOfOrder{
            c:1,a:2,d:3,b:4
        };
    }
}