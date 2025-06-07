contract ExplicitInit {
    init() {
        // explicit empty init function
    }
    receive() {}
}

contract UseExplicit {
    receive() {
        // Test using initOf and codeOf with a contract that has an explicit init
        let pkg = initOf ExplicitInit();
        let codePkg = codeOf ExplicitInit;

        // Force evaluation by assigning to dummy variables
        let dummy_code: Cell = pkg.code;
        let dummy_data: Cell = pkg.data;
        let dummy_codePkg: Cell = codePkg;
    }
}
