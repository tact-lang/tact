contract TheKingPrawn {
    init() {}
    receive() {}
}

contract Test {
    receive() {
        let s: StateInit = initOf TheKingPrawn();
    }
}
