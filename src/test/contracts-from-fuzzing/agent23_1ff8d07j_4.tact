contract D {
    init() {}
}

contract B {
    init() {
        let pkg = initOf D();
    }
}

contract C {
    init() {
        let pkg = initOf D();
    }
}

contract A {
    init() {
        let pkg1 = initOf B();
        let pkg2 = initOf C();
    }
}
