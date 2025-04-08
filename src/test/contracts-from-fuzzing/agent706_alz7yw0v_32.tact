struct StrangeOrder {
    c: Int;
    a: Int;
    b: Int;
}

contract TestContract {
    val: StrangeOrder;

    init() {
        self.val = StrangeOrder{
            c:3,
            a:1,
            b:2
        };
    }
}