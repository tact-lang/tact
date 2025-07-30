struct Nested {
    inner: String?;
    flag: Bool;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ inner: null, flag: false };
    }

    receive() {
        self.data = Nested{ inner: "abc", flag: true };
    }
}