contract A {
    init() {} // explicit init function
    receive() {}
}

contract TestValid {
    receive() {
        let s: StateInit = initOf A();
        let code: Cell = codeOf A;
    }
}
