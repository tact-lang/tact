struct Nested {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    data: Nested; 

    init() {
        self.data = Nested{val1: 1, val2: true};
    }
}
