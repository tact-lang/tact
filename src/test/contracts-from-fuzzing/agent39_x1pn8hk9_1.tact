contract A {
    init() {
       let s = initOf B();
    }
}

contract B {
    init() {
       let s = initOf A();
    }
}
