contract A {
    init(x: Int) {
        // Attempt to initialize contract B within contract A
        let _ = initOf B(x + 1);
    }
    receive() {}
}

contract B {
    init(y: Int) {
        // Attempt to initialize contract A within contract B, creating a cyclic dependency
        let _ = initOf A(y - 1);
    }
    receive() {}
}
