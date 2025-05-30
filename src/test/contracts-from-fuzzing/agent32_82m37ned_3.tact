contract Simple {
    init() {}
    receive() {}
}

contract TestA {
    receive() {
        let s = initOf Simple();
    }
}
