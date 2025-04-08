struct Nested {
    deep: Int;
    opt: Bool?;
}

contract TestContract {
    s: Nested;

    init() {
        self.s = Nested{ deep: 1, opt: true };
    }
}