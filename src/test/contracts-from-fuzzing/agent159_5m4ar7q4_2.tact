contract Simple {
    init() {}
    receive() {}
}

contract Test {
    receive() {
        let initCell = initOf Simple();
        let codeCell = codeOf Simple;
    }
}
