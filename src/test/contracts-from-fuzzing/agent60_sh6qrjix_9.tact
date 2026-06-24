contract TestParams2(a: Int) {
    // No init() function allowed due to contract parameters syntax
    receive() {
        // Valid usage of initOf with a contract with parameters: provide a value
        let pkg = initOf TestParams2(123);
        // pkg is of type StateInit containing code and data
        let c: Cell = pkg.code;
        let d: Cell = pkg.data;
    }
}
