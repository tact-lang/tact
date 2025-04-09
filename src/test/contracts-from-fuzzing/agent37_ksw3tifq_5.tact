///////////////////////////////
// Test 5: Deep hierarchical contract graph (chain depth 5: A -> B -> C -> D -> E)
///////////////////////////////

contract E {}

contract D {
    init() {
        let pkgE = initOf E();
    }
}

contract C {
    init() {
        let pkgD = initOf D();
    }
}

contract B {
    init() {
        let pkgC = initOf C();
    }
}

contract A {
    init() {
        let pkgB = initOf B();
    }
}
