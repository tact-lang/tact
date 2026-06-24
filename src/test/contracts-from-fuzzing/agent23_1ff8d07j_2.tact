contract C {
    init() {}
}

contract B {
    init() {
        let pkg = initOf C();
    }
}

contract A {
    init() {
        let pkg = initOf B();
    }
}
