struct Nested {
    inner: Int;
    flag: Bool?;
}

contract NestedStructTest {
    stored: Nested;

    init() {
        self.stored = Nested{ inner: 5, flag: true };
    }

    receive() {
        if (self.stored.flag != null) {
            self.stored = Nested{ inner: self.stored.inner + 1, flag: false };
        } else {
            self.stored = Nested{ inner: 0, flag: true };
        }
    }
}