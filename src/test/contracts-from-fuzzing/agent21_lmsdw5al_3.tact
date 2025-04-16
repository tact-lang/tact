contract Recurse {
    receive() {
         // Recursive initialization: using initOf on itself
         let s = initOf Recurse();
         let addr = contractAddress(s);
    }

    init() {}
}
