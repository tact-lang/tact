/* Snippet 4: Cross-dependent recursive initOf usage to test cyclic dependency handling */

contract A {
    init() {
         // In A's init, get initial state of contract B
         let b_init: StateInit = initOf B();
    }
}

contract B {
    init() {
         // In B's init, get initial state of contract A, introducing cyclic dependency
         let a_init: StateInit = initOf A();
    }
}
