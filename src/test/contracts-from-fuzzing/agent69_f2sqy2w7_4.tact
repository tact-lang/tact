contract Simple {}

contract TestValid {
    receive() {
        let c: Cell = codeOf Simple;
        let s: StateInit = initOf Simple();
    }
}
