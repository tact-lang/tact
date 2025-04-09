contract A {
    init() {
        let pkg = initOf B();
    }
}

contract B {
    init() {
        let pkg = initOf A();
    }
}
