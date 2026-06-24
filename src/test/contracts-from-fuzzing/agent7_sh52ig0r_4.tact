/* Test 7: Mutually Recursive Contracts using initOf */

contract A {
    init(x: Int) {
        // In the initialization of A, we reference B
        let sB = initOf B(x);
    }
}

contract B {
    init(y: Int) {
        // In the initialization of B, we reference A
        let sA = initOf A(y);
    }
}

contract TestMR {
    fun getAddress(): Address {
       let s = initOf A(10);
       return contractAddress(s);
    }
}
