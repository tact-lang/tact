contract A {
    // Simple contract with no parameters and implicit empty init()
    receive() {}
}

contract TestValid {
    receive() {
         // Valid usage for contract A: using empty parentheses with initOf
         let a_state = initOf A();
         // a_state is a struct with fields: code and data
         let a_code = codeOf A;
    }
}

contract TestNonContract {
    receive() {
         // Attempt to call initOf with a non-contract type (an integer) should produce a compile error
         // Uncomment the following line to see the expected compilation error
         // let error_init = initOf 123;
    }
}

contract TestUndefinedContract {
    receive() {
         // Attempt to use initOf with an undefined contract should produce a compile error
         // Uncomment the following line to see the expected compilation error
         // let error_init = initOf NonExistent();
    }
}

contract B(x: Int, y: Int) {
    // Contract with contract parameters; no explicit init() function since parameters define the state
    receive() {}
}

contract TestB {
    receive() {
         // Valid usage: providing required parameters for contract B
         let b_state = initOf B(1, 2);
         let b_code = codeOf B;
    }
}

contract H(x: Int) {
    // Contract with a single required parameter
    // No explicit init() function because we're using contract parameters
    receive() {}
}

contract TestH {
    receive() {
         // Missing required parameter x for contract H; expected to produce a compile error
         // Uncomment the following line to see the expected compilation error
         // let h_state = initOf H();
    }
}

contract TestInvalidInit {
    receive() {
         // Providing an extra argument to initOf for a contract that expects 0 parameters
         // Uncomment the following line to see the expected compilation error
         // let error_state = initOf A(1);
    }
}

contract TestCompareFixed {
    receive() {
         // Comparing initOf and codeOf: the code field of the state and direct codeOf should be equivalent
         let a_state = initOf A();
         let a_code_from_state = a_state.code;
         let a_code_direct = codeOf A;
         // The following dummy assignment forces usage of the expressions to avoid optimizations
         let _dummy = a_code_from_state;
         let _dummy2 = a_code_direct;
    }
}
