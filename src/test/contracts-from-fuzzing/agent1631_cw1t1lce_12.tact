struct WithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract CombOptions {
    x: Int;
    y: String;
    nested: WithOptionals;

    init() {
        self.x = 42;
        self.y = "Test";
        self.nested = WithOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}