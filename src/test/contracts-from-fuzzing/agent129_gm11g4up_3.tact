contract Simple {
    init() {}
    receive() {}
}

contract TestCode {
    receive() {
         let cell = codeOf Simple;
    }
}
