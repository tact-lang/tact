/* Test Snippet 2: Multi-level initialization inside constructors */

contract C {
    init() {}
}

contract B {
    init() {
        // Multi-level: initialize C inside constructor of B
        let c_init: StateInit = initOf C();
    }
}

contract A {
    fun test(): Bool {
        let b_init: StateInit = initOf B();
        return true;
    }
    init() {}
}
