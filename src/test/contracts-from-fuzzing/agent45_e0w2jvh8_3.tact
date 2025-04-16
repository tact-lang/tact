contract A {
    init(a: Int) {
         // Recursive dependency: A initializes B
         let s = initOf B(a + 1);
         let addr = contractAddress(s);
    }
}

contract B {
    init(b: Int) {
         // Recursive dependency: B initializes A
         let s = initOf A(b + 1);
         let addr = contractAddress(s);
    }
}

contract Caller {
    receive() {
         // Start the recursive chain
         let s = initOf A(1);
         let addr = contractAddress(s);
    }
}
