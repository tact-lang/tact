struct Small {
    a: Int;
}

contract Test {
    opt: Small?;

    init() {
        self.opt = null;
    }
}