struct Nested {
    inner1: Int;
    inner2: Bool;
    inner3: String;
}

contract TestContract {
    s: Nested;
    init() {
        self.s = Nested{
            inner1: 42,
            inner2: true,
            inner3: "test"
        };
    }
}
