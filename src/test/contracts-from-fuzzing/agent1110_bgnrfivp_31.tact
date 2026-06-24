struct OutOfOrder {
    y: Int;
    x: Int;
}

contract OrderCheck {
    val: OutOfOrder;

    init() {
        self.val = OutOfOrder{ y: 20, x: 10 };
    }
}