struct Simple {
    v: Int;
}

contract ArrayOfStructs {
    s1: Simple;
    s2: Simple;
    s3: Simple;
    s4: Simple;
    s5: Simple;

    init() {
        self.s1 = Simple{v:1};
        self.s2 = Simple{v:2};
        self.s3 = Simple{v:3};
        self.s4 = Simple{v:4};
        self.s5 = Simple{v:5};
    }
}