struct Nested {
    val1: Int;
}

contract TestContract {
    data: Nested;
    init() {
        self.data = Nested{val1: 123};
    }
}