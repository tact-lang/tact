contract Simple {
    init() {}
    receive() {}
}

contract Test {
    receive() {
        let s: StateInit = initOf Simple();
    }
}