contract Simple {
    init() {}
    receive() {
        let s: StateInit = initOf Simple();
        let c: Cell = codeOf Simple;
    }
}
