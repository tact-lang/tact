contract B(x: Int) {
    receive() {}
}

contract TestValid2 {
    receive() {
         // Valid usage for a contract with parameters
         let s = initOf B(123);
         let c = codeOf B;
         let addr = contractAddress(s);
         addr; // just to use addr
    }
}
