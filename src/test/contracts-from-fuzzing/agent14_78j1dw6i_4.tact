contract A {
    receive() {}
}

contract B {
    receive() {
        let x: Cell = codeOf A;
        let state = initOf A();
    }
}
