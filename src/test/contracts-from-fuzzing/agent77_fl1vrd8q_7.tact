contract JustEmpty {
    receive() {}
}

contract ParamContract(x: Int, y: Int) {
    // Contract with parameters and without an init() function
    receive() {}
}

contract SelfTest {
    receive() {
        // Using initOf and codeOf on the current contract
        let si = initOf SelfTest();
        let code1 = myCode();
        let code2 = codeOf SelfTest;
        // Dummy usage to avoid unused variable warnings
        let dummy = 0;
    }
}

contract Test {
    receive() {
        // Valid usage on a contract without parameters
        let si1 = initOf JustEmpty();
        let codeA = codeOf JustEmpty;

        // Valid usage on a contract with parameters
        let si2 = initOf ParamContract(10, 20);
        let codeB = codeOf ParamContract;

        // The following two cases are expected to fail:
        // 1. Passing a non-contract type to initOf
        //    Uncommenting the line below should yield a compiler error.
        // let err1 = initOf 123;

        // 2. Using an undefined contract type
        //    Uncommenting the line below should yield a compiler error.
        // let err2 = initOf NonExistent();
        
        // Dummy operation to use declared variables
        let sum = 1 + 2;
        dummy(sum);
    }
}

fun dummy(x: Int) {}