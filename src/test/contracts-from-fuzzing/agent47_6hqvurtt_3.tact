contract A {
    receive() {}
}

contract B {
    receive() {
        let aInit = initOf A();
        let aCode = codeOf A;
    }
}
