struct Nested {
    val: Int;
    opt: Int?;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ val: 1, opt: null };
    }
}