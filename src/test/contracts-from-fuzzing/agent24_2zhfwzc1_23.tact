struct WeirdOrdering {
    str: String;
    boolean: Bool;
    number: Int;
}

contract WeirdOrderingTest {
    a: WeirdOrdering;

    init() {
        self.a = WeirdOrdering{
            str: "weird",
            boolean: true,
            number: 88,
        };
    }
}