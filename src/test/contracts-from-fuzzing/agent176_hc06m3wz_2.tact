struct Nested {
    inner1: Int;
    inner2: Bool;
}

contract TestContract {
    val1: Int = 1;
    val2: Bool = true;
    val3: String = "test";
    val4: Cell; // remove default value for emptyCell()
    nested: Nested = Nested{ inner1: 10, inner2: false };

    init() {
        self.val1 = 123;
        self.val4 = emptyCell();
        self.nested = Nested{ inner1: 456, inner2: true };
    }
}