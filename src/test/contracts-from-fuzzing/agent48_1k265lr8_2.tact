contract Simple {
    init() {}
    receive() {}
}

contract Usage {
    receive() {
        let s: StateInit = initOf Simple();
        let c: Cell = codeOf Simple;
    }
}
