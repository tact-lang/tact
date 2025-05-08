struct Base {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    data: Base?;

    init() {
        self.data = Base{
            a: 10,
            b: true,
            c: "hello"
        };
    }
}