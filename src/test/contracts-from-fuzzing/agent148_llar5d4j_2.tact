contract Simple {
    receive() {}
}

contract Test {
    receive() {
         let state = initOf Simple();
         let code = codeOf Simple;
    }
}
