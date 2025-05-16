contract Def {
    // A contract with implicit empty init
    receive() {}
}

contract TesterDef {
    receive() {}

    // Testing initOf and codeOf on a contract with no parameters (implicit init function)
    get fun test_def(): Bool {
        let pkg = initOf Def();
        return codeOf Def == pkg.code;
    }
}
