struct Nested {
    n1: Int;
    n2: Bool;
}

contract TestContract {
    val: Nested;

    init() {
        self.val = Nested{ n1: 1, n2: true };
    }
}