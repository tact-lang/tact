struct InnerA {
    val1: Int;
    val2: String;
}

contract TestContract {
    data: InnerA;
    init() {
        self.data = InnerA{val1: 1, val2: "test"};
    }
}
