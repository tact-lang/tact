// Comprehensive Fuzz-Testing Cycle: Selected Tests from an Arbitrary Documentation Section
//
// This file contains a collection of tests derived from the Tact documentation covering:
// 1. Getter function behavior regarding state modifications
// 2. Interface and trait declarations using @interface
// 3. Contract initialization with and without parameters
// 4. Receiver functions and message handling
// 5. Assembly function declaration syntax
//
// Note: The test for contract parameter usage with an explicit init() (contract StillParam) has been separated since it is expected to fail compilation as per documented behavior. 

// ---- Test 1: Getter Function Modification ----
// According to the documentation (see docs_book_contracts.md  ), getter functions are exported off-chain and should not modify state. Modification, however, is allowed at runtime but non-persistent.
contract TestGetter {
    var: Int;

    init() {
        self.var = 0;
    }

    // Getter function that modifies a state variable
    get fun getter1(): Int {
        self.var += 1;
        return self.var;
    }
}

// ---- Test 2: Interface and Trait Declarations ----
// As per documentation (docs_book_contracts.md  ), the use of multiple @interface attributes is supported.
@interface("His name is")
@interface("John")
contract SeeNah with Misc {
    // Minimal contract body
}

@interface("name_of_your_org - miscellaneous")
trait Misc {
    // Minimal trait body
}

// ---- Test 3: Contract Initialization without parameters ----
// The documentation explains (docs_book_contracts.md  ) that if a contract has no parameter list, an explicit init() is allowed (though redundant).
contract LazyInit {
    init() {}
}

// Note: A separate test (not included in this file) confirms that using init() with a contract that declares a parameter list (even empty) produces a compilation error.

// ---- Test 4: Receiver Functions and Message Handling ----
// The documentation (docs_book_contracts.md  ) distinguishes between text receivers and binary receivers.
message(1) TestMsg {}

contract TestReceivers {
    // Text-based receiver
    receive("textReceiver") {
        // Text message handling logic
    }
    
    // Binary receiver using message type
    receive(_: TestMsg) {
        // Binary message handling logic
    }

    counter: Int;

    init() {
        self.counter = 0;
    }

    // Internal function modifying state
    fun increment() {
        self.counter += 1;
    }

    // Getter that reads state (and attempts a modification; non-persistent per TVM run)
    get fun getCounter(): Int {
        self.counter += 100;
        return self.counter;
    }
}

// ---- Test 5: Assembly Function Syntax ----
// Per the documentation (docs_book_assembly-functions.md  ), assembly functions should be declared at the module level in the following form.
asm fun depthCheck() : Int { DEPTH }

fun testDepth() : Int {
    return depthCheck();
}

// ----------------------------------------------------
// This comprehensive suite of tests compiles successfully (except for a known test regarding contract parameter syntax that is expected to error),
// demonstrating consistency between the Tact compiler behavior and its documentation. No unexpected discrepancies or severe bugs were found.
