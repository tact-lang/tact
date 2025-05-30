struct Nested {
    foo: Int?;
}

contract TestContract {
    payload: Nested?;

    init() {
        self.payload = null;
    }

    receive() {
        self.payload = Nested{foo: 42};
    }
}