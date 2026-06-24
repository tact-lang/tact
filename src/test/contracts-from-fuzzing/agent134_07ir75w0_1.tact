struct Nested {
    val1: Int;
    val2: Bool;
    optVal: Int?;
}

contract TestContract {
    testField: Nested;

    init() {
        self.testField = Nested{
            val1: 1,
            val2: true,
            optVal: null,
        };
    }
}
