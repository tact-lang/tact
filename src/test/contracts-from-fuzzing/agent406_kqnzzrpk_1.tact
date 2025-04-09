struct Nested {
    n: Int;
    opt: Int?;
}

contract TestContract {
    data: Nested;
    init() {
        self.data = Nested{ n: 42, opt: null };
    }
}