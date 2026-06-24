contract WithInit {
    x: Int;
    init(x: Int) {
        self.x = x;
    }
    receive() {}
}

contract TestWithInit {
    receive() {
        let s: StateInit = initOf WithInit(10);
    }
}

contract CodeSelf {
    receive() {
        let code: Cell = codeOf CodeSelf;
    }
}
