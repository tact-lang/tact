struct Nested {
    val1: Int;
    val2: Bool;
    val3: Cell;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            val1: 1,
            val2: true,
            val3: emptyCell(),
        };
    }
}