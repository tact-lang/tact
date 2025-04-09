contract Simple {
    receive() {}
}

contract Test {
    receive() {
        let st = initOf Simple();
        let c = codeOf Simple;
    }
}
