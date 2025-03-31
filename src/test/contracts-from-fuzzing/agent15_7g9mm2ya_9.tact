// Comprehensive Fuzz-Testing of initOf and Cross-Contract Relationships
// This unified snippet defines multiple test cases with uniquely named contracts to avoid naming collisions.

// Test Case 1: Simple Cross-Contract Initialization
contract B1 {
    init(x: Int) {}
}

contract A1 {
    // Retrieves the code component from B1's initial state
    get fun getBCode() : Cell {
       return initOf B1(42).code;
    }
}

// Test Case 2: Multi-Level Hierarchical Dependencies (A2 <- B2 <- C2)
contract C2 {
    init() {}
}

contract B2 {
    get fun getCCode(): Cell {
        return initOf C2().code;
    }
}

contract A2 {
    get fun getBCode(): Cell {
        return initOf B2().code;
    }
}

// Test Case 3: Nested Dependency Chain retrieving data fields (F3 -> E3 -> D3)
contract F3 {
    init() {}
}

contract E3 {
    get fun getFData() : Cell {
        return initOf F3().data;
    }
}

contract D3 {
    get fun getEData() : Cell {
        return initOf E3().data;
    }
}

// Test Case 4: Recursive (Cyclic) Initialization among Contracts using parameters
contract A4(a: Int) {
    get fun getBInit(): Cell {
        return initOf B4(self.a + 1).data;
    }
}

contract B4(b: Int) {
    get fun getCInit(): Cell {
        return initOf C4(self.b + 1).data;
    }
}

contract C4(c: Int) {
    get fun getAInit(): Cell {
        return initOf A4(self.c + 1).data;
    }
}

// Test Case 5: Self-Referencing Initialization
contract Self5 {
    get fun selfInit(): Cell {
        return initOf Self5().data;
    }
}

// Test Case 6: Extended Multi-Level Chain (H6 -> G6 -> F6 -> E6 -> D6)
contract H6 {
    init() {}
    get fun getId(): Int {
       return 1;
    }
}

contract G6 {
    get fun getHData(): Cell {
      return initOf H6().data;
    }
}

contract F6 {
    get fun getGData(): Cell {
      return initOf G6().data;
    }
}

contract E6 {
    get fun getFData(): Cell {
      return initOf F6().data;
    }
}

contract D6 {
    get fun getEData(): Cell {
      return initOf E6().data;
    }
}

// End of test cases
// This comprehensive set of tests examines various aspects of the initOf functionality:
// - Direct cross-contract initialization (Test Case 1)
// - Hierarchical and nested contract graphs (Test Cases 2 and 3)
// - Recursive cycles with contract parameters and self-references (Test Cases 4 and 5)
// - Extended dependency chains (Test Case 6)

// All these tests aim to validate that the Tact compiler correctly computes the StateInit struct (code and data fields)
// and resolves cross-contract and recursive dependencies according to the documented behavior of initOf.
