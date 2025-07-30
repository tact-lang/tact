struct Nested { inner: Int?; flag: Bool }

contract OptionalNested {
    data: Nested;

    init() {
        self.data = Nested{ inner: null, flag: true };
    }
}