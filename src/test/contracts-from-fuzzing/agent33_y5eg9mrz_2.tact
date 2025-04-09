contract InitSimple {
    receive() {}
}

contract TestInitSimple {
    receive() {
        // Valid usage of initOf on a simple contract without parameters
        let si = initOf InitSimple();
    }
}
