contract A {
    // Implicit empty init
    receive() {}
}

contract Tester {
    get fun testInitCode(): Cell {
         let s: StateInit = initOf A();
         return s.code;
    }
    
    get fun testInitData(): Cell {
         let s: StateInit = initOf A();
         return s.data;
    }
    
    get fun testCode(): Cell {
         return codeOf A;
    }
    
    receive() {}
}
