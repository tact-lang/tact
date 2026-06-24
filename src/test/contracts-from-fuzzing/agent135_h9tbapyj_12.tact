contract SelfEquality {
    receive() {
         let codeCell: Cell = codeOf SelfEquality;
         let myCodeCell: Cell = myCode();
         let dummy: Int = codeCell == myCodeCell ? 1 : 0;
    }
}

// Edge case: Using initOf for a contract with parameters correctly
contract WithParams(param: Int) {
    // Using contract parameters syntax
    receive() {}
}

contract TestWithParams {
    receive() {
        let s: StateInit = initOf WithParams(123);
    }
}

// Edge case: Passing non-contract type to initOf / codeOf
contract TestInvalidUsage {
    receive() {
        // The following lines would cause compilation errors, so they are commented out
        // let s = initOf 123;
        // let c = codeOf 123;
        let dummy: Int = 1;
    }
}

// Edge case: Undefined contract type usage; expected compile-time error
// Uncommenting the following contract will produce a compilation error as expected
// contract TestUndefined {
//     receive() {
//         let c = codeOf UndefinedContract;
//     }
// }
