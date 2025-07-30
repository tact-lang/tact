contract ExplicitInit {
    init(x: Int) {
        // A simple initialization
    }
    receive() {}
}

contract TestExplicit {
    receive() {
        // Valid usage with explicit init parameters
        let pkg = initOf ExplicitInit(99);
        let code = codeOf ExplicitInit;
    }
}
