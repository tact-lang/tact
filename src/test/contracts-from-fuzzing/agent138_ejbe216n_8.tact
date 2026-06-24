contract F {
    init(x: Int) {
        // custom initialization using parameter x
    }
    receive() {
         // Test F: using initOf with a custom init function parameter
         let init_state = initOf F(999);
         // Test that the contract code extraction works
         let code_state = codeOf F;
    }
}

// Additional test for contract with parameters but no init function (implicit empty init is not provided)
contract G(param: Int) {
    receive() {
         // Using codeOf for a contract with parameters should work
         let code_state = codeOf G;
         // Using initOf for such a contract is expected to fail, uncomment to test failure:
         // let init_state = initOf G(42);
    }
}

// Test for passing non-contract type (expected to fail, included for documentation purpose)
contract H {
    receive() {
         // Uncommenting the next line should trigger a compilation error
         // let wrong = initOf 123;
    }
}

// Test for undefined contract type (expected to fail, included for documentation purpose)
contract I {
    receive() {
         // Uncommenting the next line should trigger a compilation error
         // let state = initOf NonExistent();
    }
}
