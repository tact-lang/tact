contract NoParam {
    receive() {}
}

contract Test1 {
    receive() {
        let s = initOf NoParam();
    }
}
