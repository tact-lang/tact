contract A {
    receive() {}
}

contract B {
    receive() {
        let c1 = codeOf A;
    }
}
