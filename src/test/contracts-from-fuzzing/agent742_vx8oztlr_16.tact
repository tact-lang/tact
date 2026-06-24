struct Nested {
    a: Int;
}

contract TestContract {
    n: Nested?;

    init() {
        self.n = null;
    }
}