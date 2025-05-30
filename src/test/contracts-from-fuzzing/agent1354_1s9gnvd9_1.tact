struct Nested {
    id: Int;
    active: Bool;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ id: 123, active: true };
    }
}