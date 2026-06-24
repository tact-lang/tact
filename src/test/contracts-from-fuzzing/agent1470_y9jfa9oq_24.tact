struct Child {
    val: Int;
}

contract TwoStructs {
    first: Child;
    second: Child;

    init() {
        self.first = Child{val: 5};
        self.second = Child{val: 6};
    }
}