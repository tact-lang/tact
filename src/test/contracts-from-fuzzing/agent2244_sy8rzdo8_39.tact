struct Different {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Int?;
    quux: Bool?;
    corge: String?;
}

contract Assignments {
    x: Different;
    y: Different;

    init() {
        self.x = Different{
            foo: 1,
            bar: true,
            baz: "a",
            qux: null,
            quux: null,
            corge: null
        };
        self.y = Different{
            foo: 2,
            bar: false,
            baz: "b",
            qux: 42,
            quux: true,
            corge: "hi"
        };
    }
}
