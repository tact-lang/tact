/* Diamond dependency graph: Contract A calls initOf on B and C, each of which calls initOf on D */

contract D {
    init() {}
}

contract B {
    init() {
        let s = initOf D();
    }
}

contract C {
    init() {
        let s = initOf D();
    }
}

contract A {
    receive() {
        let s1 = initOf B();
        let s2 = initOf C();
    }
}
