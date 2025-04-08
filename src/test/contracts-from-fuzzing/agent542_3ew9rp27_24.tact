struct OutOfOrder {
    b: Bool;
    s: String;
    i: Int;
}

contract TestContract {
    val: OutOfOrder;

    init() {
        self.val = OutOfOrder{
            s: "xx",
            i: -1,
            b: true
        };
    }
}