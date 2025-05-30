contract MyContract {}

contract TestInitOf {
    fun test() {
        // Testing initOf and codeOf expressions as per the documentation
        // initOf returns a StateInit, but StateInit cannot be directly dumped or compared to null.
        // Instead we simply call it to ensure it compiles, and dump codeOf which returns a Cell.
        let _stateInit: StateInit = initOf MyContract();
        let code: Cell = codeOf MyContract;
        dump(code);
    }

    receive() {
        self.test();
    }
}
