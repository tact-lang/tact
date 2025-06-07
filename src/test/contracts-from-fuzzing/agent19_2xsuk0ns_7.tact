/* Test 5 (fixed): Using initOf with contract parameters (implicit init) and proper referencing */

contract ParamContract(a: Int, b: Int) {
    // no explicit init function since contract parameters are used
    get fun sum(): Int {
        return self.a + self.b;
    }
}

contract Tester {
    get fun test(): Int {
        // Correct usage with parameters
        let s: StateInit = initOf ParamContract(3, 4);
        return 0;
    }
}
