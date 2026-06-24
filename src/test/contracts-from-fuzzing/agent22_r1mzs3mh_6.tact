// Fuzzing test summary for initOf functionality and cross-contract relationships
// ================================================================
// Test 1. Simple initialization using initOf and contractAddress

contract Simple {
    // Getter returns contract address computed via initOf
    get fun addr(): Address {
       return contractAddress(initOf Simple());
    }
}

// Test 2. Hierarchical contracts: Parent -> Child -> GrandChild
contract GrandChild(x: Int) {
    get fun getX() : Int {
       return self.x;
    }
}

contract Child(a: Int) {
    get fun childToGrand(): Address {
       return contractAddress(initOf GrandChild(self.a));
    }
}

contract Parent() {
    get fun parentToChild(): Address {
       return contractAddress(initOf Child(42));
    }
}

// Test 3. Mutual recursion between two contracts A and B
contract A() {
    get fun addrB(): Address {
         return contractAddress(initOf B());
    }
}

contract B() {
    get fun addrA(): Address {
         return contractAddress(initOf A());
    }
}

// Test 4. Contract parameters test with trailing comma and computed field access
contract ParamTest(x: Int, y: Int,) {
    get fun sum(): Int {
       return self.x + self.y;
    }
}

// Test 5. Self-recursive contract initializing itself
contract SelfRecursive() {
    get fun selfAddr(): Address {
         return contractAddress(initOf SelfRecursive());
    }
}

// Test 6. Deeply nested initialization chain A1 -> A2 -> ... -> A10
contract A1() {
    get fun next() : Address {
         return contractAddress(initOf A2());
    }
}

contract A2() {
    get fun next() : Address {
         return contractAddress(initOf A3());
    }
}

contract A3() {
    get fun next() : Address {
         return contractAddress(initOf A4());
    }
}

contract A4() {
    get fun next() : Address {
         return contractAddress(initOf A5());
    }
}

contract A5() {
    get fun next() : Address {
         return contractAddress(initOf A6());
    }
}

contract A6() {
    get fun next() : Address {
         return contractAddress(initOf A7());
    }
}

contract A7() {
    get fun next() : Address {
         return contractAddress(initOf A8());
    }
}

contract A8() {
    get fun next() : Address {
         return contractAddress(initOf A9());
    }
}

contract A9() {
    get fun next() : Address {
         return contractAddress(initOf A10());
    }
}

contract A10() {
    get fun base() : Address {
         return contractAddress(initOf A10());
    }
}

// Test 7. Computed expression in initOf: comparing two contracts with same computed parameter
contract Computed(x: Int) {
    get fun getX() : Int {
         return self.x;
    }
}

contract TestComputed() {
    get fun test() : Int {
         let addr1: Address = contractAddress(initOf Computed(21 + 21));
         let addr2: Address = contractAddress(initOf Computed(42));
         if (addr1 == addr2) {
             return 1; // success
         } else {
             return 0; // failure
         }
    }
}

// ================================================================
// The above snippet comprehensively tests:
// - The basic usage of initOf to compute StateInit and generate contract addresses (see docs:  ,  )
// - Hierarchical parent-child relationships (Parent -> Child -> GrandChild)
// - Mutual recursion between contracts (A <-> B)
// - Handling of contract parameters with trailing commas and self access.
// - Deep nested chains of contract initialization (A1 through A10).
// - Evaluating computed expressions within initOf calls (Computed & TestComputed).
// 
// All tests compile successfully, indicating that the compiler behavior aligns with the official documentation on initOf as detailed in the Tact docs (see  ,  ,  ).
// There were no inconsistencies found between documented behavior and compiler output regarding cross-contract initialization and complex contract graphs.
// ================================================================

