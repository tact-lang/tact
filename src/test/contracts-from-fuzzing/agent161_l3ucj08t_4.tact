contract Example1 {
    receive() {}

    // Valid usage: contract with no init parameters
    get fun testInit(): StateInit {
        return initOf Example1();
    }

    // Valid usage: obtaining the code of the contract
    get fun testCode(): Cell {
        return codeOf Example1;
    }
}
