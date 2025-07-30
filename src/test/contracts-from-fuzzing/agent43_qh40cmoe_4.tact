contract Simple {
    // No state variables, no parameters, implicit empty init
    receive() {}
}

contract Caller {
    receive() {
        let state = initOf Simple();
        let code = codeOf Simple;
    }
}
