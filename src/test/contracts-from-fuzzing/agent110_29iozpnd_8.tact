/// Test cases for initOf and codeOf expressions in Tact

// Test Case 1: Valid initOf usage with a contract having an init function with parameters
contract A {
    init(x: Int) {
        // simple initialization logic
    }
    receive() {}
}

contract TestInitValid {
    receive() {
        // using initOf on a valid contract call
        let pkg = initOf A(42);
    }
}

// Test Case 2: Valid codeOf usage on a contract
contract B {
    receive() {}
}

contract TestCodeValid {
    receive() {
        // obtaining the compiled code cell of contract B
        let c: Cell = codeOf B;
    }
}

// Test Case 3: Self-referencing codeOf, should be equivalent to myCode()
contract SelfCompare {
    receive() {
        let a: Cell = myCode();
        let b: Cell = codeOf SelfCompare;
        // Compute equality; differences are not expected in a correct compiler
        let eq: Bool = (a == b);
        // The variable eq is not used further; this test simply confirms both expressions compile and type-check
    }
}

// Test Case 4: Contract with contract parameters using both initOf and codeOf
contract CP(param: Int) {
    receive() {}
}

contract TestCP {
    receive() {
        let pkg = initOf CP(99);
        let codeCP: Cell = codeOf CP;
    }
}

// Edge Case 1: Passing a non-contract type to initOf (should fail to compile if uncommented)
contract TestNonContractInit {
    receive() {
        // Uncommenting the following line should produce a compilation error
        // let s = initOf 123;
    }
}

// Edge Case 2: Using initOf with an undefined contract (should fail to compile if uncommented)
contract TestUndefined {
    receive() {
        // Uncommenting the following line should produce a compilation error
        // let s = initOf UndefinedContract();
    }
}
