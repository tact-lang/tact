struct InnerA {
    a: Int;
    b: String;
    c: Bool;
}

contract TestContract {
    fieldA: InnerA;

    init() {
        self.fieldA = InnerA{
            a: 42,
            b: "test",
            c: true,
        };
    }
}