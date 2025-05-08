struct Nest {
    x: Int;
    y: Int?;
}

contract BugTest {
    foo: Nest;

    init() {
        self.foo = Nest{ x: 1 };
    }
}