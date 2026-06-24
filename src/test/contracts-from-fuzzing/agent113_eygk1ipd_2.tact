contract A {
    // Contract with implicit empty init
    receive() {}
}

contract Test {
    receive() {
        let a = initOf A();
        let b = codeOf A;
    }
}
