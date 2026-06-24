message MyMsg { x: Int; }

contract Test {
    // Valid receiver with discarded typed parameter
    receive(_: MyMsg) {}
    
    // Dummy empty message receiver to ensure contract compiles
    receive() {}
}
