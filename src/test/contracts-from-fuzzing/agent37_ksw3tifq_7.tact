///////////////////////////////
// Test 7: Diamond dependency graph
///////////////////////////////

contract D {}

contract B {
    init() {
        // B depends on D
        let pkgD = initOf D();
    }
}

contract C {
    init() {
        // C depends on D
        let pkgD = initOf D();
    }
}

contract A {
    init() {
        // A depends on both B and C
        let pkgB = initOf B();
        let pkgC = initOf C();
    }
}
