contract Parameterized {
    init(a: Int, b: Int) {
        // initialize with two parameters
    }
}

contract UseParameterized {
    receive() {
         // using initOf with parameters
         let pInit = initOf Parameterized(5, 10);
         let addr = contractAddress(pInit);
    }
}
