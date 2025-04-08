struct OutOfOrder {
    c: Int;
    a: Int;
    b: Int;
}

contract Disorder {
    s: OutOfOrder;

    init() {
        self.s = OutOfOrder{c:1,a:2,b:3};
    }
}