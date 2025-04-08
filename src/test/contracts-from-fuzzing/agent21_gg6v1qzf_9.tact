struct Demo {
    foo: Int = 5;
    bar: String?;
    baz: Bool = true;
}

contract Test {
    s: Demo;

    init() {
        self.s = Demo{
            foo: 42,
            bar: "hey",
            baz: false
        };
    }
}