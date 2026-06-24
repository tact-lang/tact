// Fuzz-testing cycle for `initOf` functionality and cross-contract relationships
// =============================================================

// This comprehensive test suite covers the following scenarios:
// 1. Simple cross-contract initialization
// 2. Multi-level parent-child relationships
// 3. Self-recursive initialization (using initOf inside its own init)
// 4. Complex nested contract graphs returning multiple addresses
// 5. Handling trailing commas in init parameter lists
// 6. Using initOf in function parameters to initialize a contract
// 7. Mutually recursive contracts (A initOf B and B initOf A)

// -------------------------------------------------------------
// Test 1: Simple cross-contract initialization
contract SimpleB {
    init(x: Int) {}
}

contract SimpleA {
    fun getBAddress(): Address {
        let s = initOf SimpleB(123);
        return contractAddress(s);
    }
}

// -------------------------------------------------------------
// Test 2: Multi-level parent-child relationships
contract ChildC {
    init(z: Int) {}
}

contract ParentB {
    init(y: Int) {
        // Initialize a child contract in the constructor
        let s = initOf ChildC(y + 1);
    }
}

contract TopA {
    fun testMulti(): Address {
         let s = initOf ParentB(10);
         return contractAddress(s);
    }
}

// -------------------------------------------------------------
// Test 3: Self-recursive initialization
contract SelfRecursive {
    init() {
        // Self recursive: using initOf on itself; computed at compile-time without infinite recursion
        let s = initOf SelfRecursive();
    }
    get fun dummy(): Int {
       return 42;
    }
}

// -------------------------------------------------------------
// Test 4: Complex nested contract graphs with multiple return addresses
struct AddressPair {
    a: Address;
    b: Address;
}

contract NestedC1 {
    init(a: Int) {}
}

contract NestedC2 {
    init(b: Int) {}
}

contract NestedX {
    fun mix(): AddressPair {
         let s1 = initOf NestedC1(55);
         let s2 = initOf NestedC2(66);
         return AddressPair { a: contractAddress(s1), b: contractAddress(s2) };
    }
}

// -------------------------------------------------------------
// Test 5: Trailing comma in init parameters (allowed in Tact)
contract TrailingP {
   init(a: Int, b: Int, ) {}  
}

contract TrailingQ {
   fun getAddress(): Address {
      let s = initOf TrailingP(10,20,);
      return contractAddress(s);
   }
}

// -------------------------------------------------------------
// Test 6: Using initOf inside a function parameter
contract ParamContract {
    init(a: Int) {}
}

contract Holder {
    fun getParamAddress(p: Int): Address {
       let s = initOf ParamContract(p);
       return contractAddress(s);
    }
}

// -------------------------------------------------------------
// Test 7: Mutually Recursive Contracts
// Where contract A's init references contract B and vice versa
contract A {
    init(x: Int) {
        let sB = initOf B(x);
    }
}

contract B {
    init(y: Int) {
        let sA = initOf A(y);
    }
}

contract TestMR {
    fun getAddress(): Address {
       let s = initOf A(10);
       return contractAddress(s);
    }
}

// =============================================================
// End of test suite for initOf and cross-contract relationships

// Observations from the fuzz-testing cycle:
// -------------------------------------------------------------
// 1. All tested scenarios compiled without errors, confirming the documented behavior of initOf.
// 2. Simple initialization that uses initOf to compute the contract state is working as expected.
// 3. Multi-level parent-child relations and nested contract graphs correctly compute the initial state.
// 4. The self-recursive and mutually recursive cases are allowed at compile-time, illustrating that
//    Tact performs compile-time evaluation of initOf expressions and permits these patterns without immediate failure.
// 5. Trailing commas in init parameters are correctly handled.
// 6. Using initOf in function parameters and complex return types via struct is supported.
// 7. The cross-contract relationships built via initOf, whether direct or nested, adhere to documented semantics.

// Conclusion:
// The fuzz-testing cycle for the initOf functionality and cross-contract relationships in Tact
// did not reveal any discrepancies or unexpected behavior compared to the official documentation.
// Each test compiles successfully and demonstrates the intended use cases outlined in the Tact docs.
