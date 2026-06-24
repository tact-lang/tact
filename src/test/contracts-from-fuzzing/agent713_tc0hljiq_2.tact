struct Child {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    s: Child;
    init() {
        self.s = Child{
            a: 123,
            b: true,
            c: "hello"
        };
    }
}