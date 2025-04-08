struct Simple {
    a: Int;
}

contract TestContract {
    s: Simple;

    init() {
        self.s = Simple{ a: 1 };
    }
}