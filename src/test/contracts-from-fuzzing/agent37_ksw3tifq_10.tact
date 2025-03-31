///////////////////////////////
// Test 10: Three-cycle recursion: A -> B -> C -> A
///////////////////////////////

contract A {
    init() {
        let pkgB = initOf B();
    }
}

contract B {
    init() {
        let pkgC = initOf C();
    }
}

contract C {
    init() {
        let pkgA = initOf A();
    }
}
