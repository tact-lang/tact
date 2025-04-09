/*
   Fuzz-testing cycle: initOf and cross-contract relationships

   This collection of snippets systematically tests various aspects of the initOf functionality:

   • Simple cross-contract initialization
   • Deeply nested multi-level initialization chains
   • Recursive self-initialization
   • Cyclic dependency between two contracts
   • Usage of contract parameters with initOf
   • A diamond-shaped (branching) dependency structure

   These tests verify that the compiler correctly computes the StateInit packages, resolves nested dependency chains,
   and computes consistent addresses via contractAddress()/contractAddressExt() as documented
   (see docs on initOf in docs_book_expressions.md and docs_book_contracts.md    ).
*/

// Snippet A: Simple cross-contract initialization
contract SimpleChild {
    init() {}
    receive() {}
}

contract SimpleParent {
    receive() {
        let s: StateInit = initOf SimpleChild();
        self.reply("Simple OK".asComment());
    }
}

// Snippet B: Deep multi-level nested dependency chain (L1 -> L2 -> L3 -> L4)
contract L1 {
    init() {}
    receive() {}
}

contract L2 {
    init() {
        let s1: StateInit = initOf L1();
    }
    receive() {}
}

contract L3 {
    init() {
        let s2: StateInit = initOf L2();
    }
    receive() {}
}

contract L4 {
    init() {
        let s3: StateInit = initOf L3();
    }
    receive() {}
}

contract Root {
    receive() {
        let s: StateInit = initOf L4();
        self.reply("Chain OK".asComment());
    }
}

// Snippet C: Recursive self-initialization
contract RecursiveSelf {
    init() {
        // Recursive call: computing the initial state of itself
        let s: StateInit = initOf RecursiveSelf();
    }
    receive() {}
}

// Snippet D: Cyclic dependency between two contracts
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

contract TriggerCyclic {
    receive() {
        self.reply("Cyclic dependency tested".asComment());
    }
}

// Snippet E: Using contract parameters with initOf
contract ParamChild(x: Int) {
    // Implicit init carried by contract parameter list
    receive() {}
}

contract ParamParent {
    receive() {
         let s: StateInit = initOf ParamChild(42);
         self.reply("Param OK".asComment());
    }
}

// Snippet F: Diamond-shaped dependency structure
contract Base {
    init() {}
    receive() {}
}

contract Left {
    init() {
        let s: StateInit = initOf Base();
    }
    receive() {}
}

contract Right {
    init() {
        let s: StateInit = initOf Base();
    }
    receive() {}
}

contract Top {
    receive() {
        let sLeft: StateInit = initOf Left();
        let sRight: StateInit = initOf Right();
        self.reply("Diamond OK".asComment());
    }
}
