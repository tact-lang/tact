/* Test Snippet: Complex Nested initOf Usage with Trailing Commas and Multiple Contracts */

// A simple contract with one integer parameter
contract X {
    init(a: Int) {}
    receive() {}
}

// A contract with two integer parameters, using trailing comma syntax
contract Y {
    init(a: Int, b: Int,) {}
    receive() {}
}

// A contract that computes and compares addresses of different contracts via initOf
contract Z {
    init() {
        // Create StateInit for contract X with a trailing comma
        let initX = initOf X(100,);
        // Create StateInit for contract Y with two parameters and a trailing comma
        let initY = initOf Y(200, 300,);

        // Compute the addresses
        let addrX = contractAddress(initX);
        let addrY = contractAddress(initY);

        // The addresses should normally be different since the contracts and parameters differ
        require(addrX != addrY, "Address collision between X and Y");
    }
    
    // Function returning the contract's own initial address
    fun ownInitAddress() : Address {
        return contractAddress(initOf Z());
    }

    receive() {}
}
