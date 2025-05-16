contract C(param: Int) {
    // Contract using contract parameters: no init() function allowed
    receive() {}
}

contract TesterParam {
    get fun testInitC(): Cell {
         let s: StateInit = initOf C(123);
         return s.data; // data field should encode the parameter
    }
    
    get fun testCodeC(): Cell {
         return codeOf C;
    }
    
    receive() {}
}
