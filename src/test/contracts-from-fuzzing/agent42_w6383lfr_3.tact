contract A {
    init() {
        // Simple contract A initialization
    }
    receive() {}
}

contract B {
    init() {
         // Use initOf to get state of contract A
         let initA = initOf A();
         // Compute address from A's init package
         let addrA = contractAddress(initA);
    }
    receive() {}
}

// Diamond dependency pattern
contract Grandchild {
    init() {
        // No dependency
    }
    receive() {}
}

contract Child1 {
   init() {
      // Initialize dependency: Grandchild
      let initGc = initOf Grandchild();
   }
   receive() {}
}

contract Child2 {
   init() {
      // Initialize dependency: Grandchild
      let initGc = initOf Grandchild();
   }
   receive() {}
}

contract Parent {
    init() {
       // Parent depends on Child1 and Child2
       let initChild1 = initOf Child1();
       let initChild2 = initOf Child2();
    }
    receive() {}
}

// Testing contract parameters with initOf
contract WithParams(param: Int) {
    // Uses contract parameter syntax. Implicit empty init().
    receive() {}
}

contract UsesParams {
    init() {
         // Passing a parameter to a contract using contract parameters
         let initWP = initOf WithParams(123);
    }
    receive() {}
}

// A tester contract to invoke initOf on multiple contracts
contract Tester {
    init() {
        let _ = initOf A();
        let _ = initOf B();
        let _ = initOf Grandchild();
        let _ = initOf Child1();
        let _ = initOf Child2();
        let _ = initOf Parent();
        let _ = initOf WithParams(456);
        let _ = initOf UsesParams();
    }
    receive() {}
}
