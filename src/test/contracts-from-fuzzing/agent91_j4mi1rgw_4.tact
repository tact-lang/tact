contract B {
    x: Int;
    init(x: Int) {
         self.x = x;
    }
    receive() {}
}

contract TestB {
    receive() {
         // Correct usage: passing parameter to initOf for contract with init parameter
         let initB = initOf B(42);
         let codeB = codeOf B;
    }
}
