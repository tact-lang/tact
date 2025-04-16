contract WithInit {
    state: Int;
    init(x: Int) {
        self.state = x;
    }
    receive() {}
}

contract Test {
    receive() {
        // Valid usage: matching parameter count
        let s: StateInit = initOf WithInit(10);
        let c: Cell = codeOf WithInit;
    }
}
