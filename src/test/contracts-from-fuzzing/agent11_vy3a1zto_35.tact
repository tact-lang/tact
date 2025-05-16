/*
Fuzz-Test Revision: AssemblySetCodeTestRev Adjustment

We encountered an error with using initOf(self). According to available documentation, to obtain initial code, the recommended expression is initOf <contract>() (see documentation on initializing state, e.g., https://docs.tact-lang.org/book/expressions#initof).

We will try a revised approach:

1. We define a helper function that creates an init package for a dummy contract (DummyContract) and then extracts its code.

2. Use that code in setCode.

Note: This test is experimental to probe the behavior of SETCODE in assembly.
*/

contract DummyContract {
    // Empty contract
    receive() {}
}

asm fun setCode(cell: Cell) { SETCODE }

contract AssemblySetCodeTestRev2 {
    receive() {
        // Instead of codeOf(self), we will obtain the initial state of DummyContract using initOf function.
        let init_pkg = initOf DummyContract();
        let c = init_pkg.code;  // Extract code
        setCode(c);
        self.reply("code set revision 2".asComment());
    }
}
