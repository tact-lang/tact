contract B {
    init() {
       let pkgA = initOf A();
    }
}

contract A {
    init() {
       let pkgB = initOf B();
    }
}
