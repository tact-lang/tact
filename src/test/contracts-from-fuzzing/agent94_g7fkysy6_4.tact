contract A {
    receive() {}
}

contract Test {
    // Valid usage of initOf for contract A with no parameters
    get fun test(): StateInit {
         return initOf A();
    }
}
