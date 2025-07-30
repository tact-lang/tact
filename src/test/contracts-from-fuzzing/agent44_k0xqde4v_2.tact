contract A {
    init() {
       // recursive initialization: A calls initOf B
       let pkg = initOf B();
    }
    // minimal receive function to enable contract deployment
    receive() {}
}

contract B {
    init() {
       // recursive initialization: B calls initOf A
       let pkg = initOf A();
    }
    receive() {}
}
