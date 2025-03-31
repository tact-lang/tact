// Test 7: Contract with parameters (no explicit init), using initOf and codeOf
contract WithParams(x: Int) {
    // No explicit init(), uses contract parameters
    receive() {}
}

contract Test7 {
    receive() {
       let st = initOf WithParams(42);
       let co = codeOf WithParams;
    }
}

// Test 8: Contract with explicit init and complex parameter expressions
contract ComplexParam {
    var1: Int;
    var2: Int;
    init(a: Int, b: Int) {
       self.var1 = a;
       self.var2 = b;
    }
    receive() {}
}

contract Test8 {
    receive() {
       let a = 10;
       let b = 20;
       let st = initOf ComplexParam(a + 5, b - 3);
       let co = codeOf ComplexParam;
    }
}

// Test 9: Contract with explicit empty init
contract ExplicitInit {
    init() {
       // explicit empty initialization
    }
    receive() {}
}

contract Test9 {
    receive() {
       let st = initOf ExplicitInit();
       let co = codeOf ExplicitInit;
    }
}

// Test 10: Consistency check with repeated initOf calls
contract Consistency {
    init(x: Int) {
       // simple initialization
    }
    receive() {}
}

contract Test10 {
    receive() {
        let a = initOf Consistency(1);
        let b = initOf Consistency(1);
        // Ideally, a and b represent the same StateInit structure.
        // No direct comparison available, but this test ensures consistent compilation.
    }
}
