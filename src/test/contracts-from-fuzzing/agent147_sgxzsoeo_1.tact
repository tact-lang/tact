contract ExampleContract {
    init(x: Int, y: Int) {
        // Valid init, do nothing
    }
    receive() {
        // Valid use of initOf and codeOf
        let st: StateInit = initOf ExampleContract(42, 100);
        let codeCell = codeOf ExampleContract;
        // No further operations
    }
}
