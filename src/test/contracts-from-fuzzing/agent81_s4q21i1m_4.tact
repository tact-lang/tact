contract Example {
    init() {}
    receive() {}
}

contract TestValidCodeOf {
    receive() {
        let c = codeOf Example;
    }
}
