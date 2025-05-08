contract B {
    receive() {}
}

contract Test2 {
    receive() {
        let c = codeOf B;
    }
}
