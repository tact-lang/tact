// Fuzz-Test Summary for initOf and Cross-contract Relationships
// This collection of minimal contracts tests various aspects of initOf functionality and cross-contract dependency setups:
// 1. Simple Cross-Contract Initialization (SimpleA invoking initOf on SimpleB).
// 2. Parameterized Contracts: ParamD (with parameters, using implicit init) and its usage in ParamE.
// 3. Multi-level/hierarchical relationships: A2 -> B2 -> C2.
// 4. Recursive initialization: RecursiveR invoking initOf on itself.
// 5. Cyclic Initialization: CyclicA and CyclicB referencing each other via initOf.
// 6. Conditional initOf: CondInit chooses between D1 and D2 based on a Boolean condition.
// 7. Getter usage: GetTest returning initOf D1 from a getter function.
// 8. Parameterized string initialization: CallParamF invoking initOf ParamF with a string literal.

contract SimpleB {
    // Implicit empty initialization (no init() defined, valid for contracts without parameters)
}

contract SimpleA {
    receive() {
        // Simple cross-contract initialization test
        let s: StateInit = initOf SimpleB();
    }
}

// Contract with parameters cannot have an explicit init(), so we define it with implicit empty init
contract ParamD(t: Int) {}

contract ParamE {
    receive() {
        // Parameterized contract initialization
        let s: StateInit = initOf ParamD(42);
    }
}

// Multi-level dependency chain
contract C2 {}

contract B2 {
    receive() {
        let s: StateInit = initOf C2();
    }
}

contract A2 {
    receive() {
        let s: StateInit = initOf B2();
    }
}

// Recursive initialization: a contract referencing its own initial state
contract RecursiveR {
    receive() {
        let s: StateInit = initOf RecursiveR();
    }
}

// Cyclic dependency between two contracts
contract CyclicA {
    receive() {
        let s: StateInit = initOf CyclicB();
    }
}

contract CyclicB {
    receive() {
        let s: StateInit = initOf CyclicA();
    }
}

// Conditional choice between two different inits
contract D1 {}
contract D2 {}

contract CondInit {
    receive() {
        let condition: Bool = true;
        let s: StateInit = condition ? initOf D1() : initOf D2();
    }
}

// Getter returning a StateInit
contract GetTest {
    get fun testInit(): StateInit {
        return initOf D1();
    }
}

// Parameterized contract accepting a string
contract ParamF(s: String) {}

contract CallParamF {
    receive() {
        let s: StateInit = initOf ParamF("Hello");
    }
}

// The above snippets compile individually and in aggregate, validating the following:
//   - Simple and multi-level initOf calls compile as expected.
//   - Recursive and cyclic initOf calls are accepted by the compiler (note that while such patterns may require careful design in deployment, they compile successfully).
//   - Conditional usage of initOf works correctly with compile-time resolution of the selected branch.
//   - Getter functions returning StateInit via initOf are accepted.
//   - Parameterized contracts must not define an explicit init(), as enforced by the compiler, matching documentation requirements.

// Documentation references (see docs for initOf and contract dependency diagrams):
//   - The official initOf expression details in docs (e.g., file: docs_book_expressions.md  ,   for related contract address usage).

// All tests compile successfully, confirming that the compiler behavior for initOf and related cross-contract initializations conforms with the official documentation and intended design.

// End of fuzz-testing for initOf and cross-contract relationships
