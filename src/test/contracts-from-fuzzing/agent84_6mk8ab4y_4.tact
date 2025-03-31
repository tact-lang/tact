contract A {
    receive() {}
}

contract TestValid1 {
    receive() {
         // Valid usage with a contract with no parameters
         let s = initOf A();
         let c = codeOf A;
         // Use s in contractAddress to avoid unused warning
         let addr = contractAddress(s);
         addr;
    }
}
