struct Nested {
    innerVal: Int;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ innerVal: 1 };
    }
}