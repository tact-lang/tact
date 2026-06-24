struct Simple {
    i: Int;
}

contract ArrayEdgeCase {
    a: Simple;
    b: Simple;
    c: Simple;
    d: Simple;

    init() {
        self.a = Simple{i:1};
        self.b = Simple{i:2};
        self.c = Simple{i:3};
        self.d = Simple{i:4};
    }
}