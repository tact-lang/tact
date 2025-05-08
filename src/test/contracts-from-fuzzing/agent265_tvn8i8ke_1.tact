struct Simple {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    val: Simple;

    init() {
        self.val = Simple{
            a: 1,
            b: true,
            c: "abc",
        };
    }
}