contract A {
    receive() {}
}

contract TestInitCode {
    receive() {
        let s = initOf A();
        let c = codeOf A;
    }
}
