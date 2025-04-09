struct Simple {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    data: Simple;
    init() {
        self.data = Simple{
            a: 1,
            b: true,
            c: "test",
        };
    }
}
