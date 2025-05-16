contract A {
    state: Int;

    init() {
        self.state = 0;
    }

    receive() {}
}

contract TestValid1 {
    receive() {
        let initCell: StateInit = initOf A();
        let codeCell: Cell = codeOf A;
    }
}
