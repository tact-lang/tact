struct Nested {
    inner: Bool;
}

contract TestContract {
    data: Cell;
    nested: Nested;

    init() {
        self.data = emptyCell();
        self.nested = Nested{ inner: true };
    }
}