contract X {
    receive() {
        // Obtain the code of the current contract using two methods
        let code1: Cell = myCode();
        let code2: Cell = codeOf X;
        // Use a dummy operation: concatenate the two cells
        // Note: In real deployment, comparing cells directly might not be feasible
        // This is just to force evaluation of both expressions.
        let _dummy: Cell = code1;
    }
}

// Contract with parameters using initOf; note that contracts with parameters require instantiation with parameters
contract C(param: Int) {
    receive() {}
}

contract Checker {
    // Extract and return the contract code from the init package
    get fun getInitCode(): Cell {
        let pkg = initOf C(42);
        return pkg.code;
    }

    // Extract and return the init data cell from the init package
    get fun getInitData(): Cell {
        let pkg = initOf C(42);
        return pkg.data;
    }

    // Directly obtain the code of contract C
    get fun getCode(): Cell {
        return codeOf C;
    }

    receive() {}
}

// Invalid usage tests; these functions are commented out because they should fail at compile-time
contract InvalidUsage {
    // The following functions demonstrate misuse of initOf and codeOf with non-contract types

    // get fun testNonContractInit(): Cell {
    //     // Using initOf on a non-contract literal should produce a compile-time error
    //     return initOf 123; // Expected error
    // }

    // get fun testNonContractCode(): Cell {
    //     // Using codeOf on a non-contract literal should produce a compile-time error
    //     return codeOf 123; // Expected error
    // }

    // get fun testUndefinedContract(): Cell {
    //     // Using initOf with an undefined contract type should produce a compile-time error
    //     let pkg = initOf Undefined(); // Expected error: Type 'Undefined' not found
    //     return pkg.code;
    // }

    receive() {}
}
