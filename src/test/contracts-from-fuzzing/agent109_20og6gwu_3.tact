contract A(param: Int) {
    // Contract with parameter; cannot have an init() function
    receive() {}
}

contract Main {
    receive() {
        let pkg = initOf A(123);
    }
}
