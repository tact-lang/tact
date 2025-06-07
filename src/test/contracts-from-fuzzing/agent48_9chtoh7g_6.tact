struct Inner {
    x: Int = 5;
    y: String = "foo";
}

contract TestContract {
    nestedOpt: Inner?;

    init() {
        self.nestedOpt = Inner{ x: 10, y: "bar" };
    }
}
