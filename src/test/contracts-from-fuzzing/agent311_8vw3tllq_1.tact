struct Simple {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    s: Simple;

    init() {
        self.s = Simple{
            a: 5,
            b: false,
            c: "abc"
        };
    }
}