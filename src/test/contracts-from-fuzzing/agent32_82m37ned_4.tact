contract Simple {
    init() {}
    receive() {}
}

contract TestB {
    receive() {
        let c = codeOf Simple;
    }
}
