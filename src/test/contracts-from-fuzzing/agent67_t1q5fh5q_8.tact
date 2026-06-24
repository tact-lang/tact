contract B(param: Int) {
    // Contract with a parameter; using contract parameters syntax means there's no explicit init()
    receive() {}
}

contract TestB {
    // Using initOf for contract B with parameter
    get fun testInitB(): StateInit {
         return initOf B(42);
    }
    
    // Using codeOf for contract B
    get fun testCodeB(): Cell {
         return codeOf B;
    }
    
    receive() {}
}
