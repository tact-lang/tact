/*
   Snippet 3: Cyclic dependency between two contracts
   Contract A's init calls initOf B, and Contract B's init calls initOf A.
   This tests the compiler's handling of cyclic dependencies in contract initialization.
*/

contract A {
    init() {
        let sB: StateInit = initOf B();
    }
    receive() {}
}

contract B {
    init() {
        let sA: StateInit = initOf A();
    }
    receive() {}
}

contract C {
    // A simple contract to trigger linking
    receive() {
        self.reply("Cyclic dependency tested".asComment());
    }
}
