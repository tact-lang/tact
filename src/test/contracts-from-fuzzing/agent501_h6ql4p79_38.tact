struct Simple {
    n: Int;
}

contract UseDefault {
    s: Simple;

    init() {
        self.s = Simple{ n: 42 };
    }
}