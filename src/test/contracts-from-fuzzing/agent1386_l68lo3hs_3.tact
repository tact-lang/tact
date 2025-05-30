struct Inner {
    x: Int = 1;
    y: Int?;
}

contract Test {
    value: Inner = Inner{};
    init() {
        self.value = Inner{
            x: 2,
            y: 3,
        };
    }
}