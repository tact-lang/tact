contract SomeContract {
    // An empty contract for testing initOf
    receive() {}
}

contract TestInitOf {
    init() {
        // Using initOf to obtain the deployment package of SomeContract
        let pkg = initOf SomeContract();
    }

    receive() {}
}
