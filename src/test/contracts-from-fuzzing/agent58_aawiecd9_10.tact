contract SelfTest {
    // Testing initOf and codeOf on the current contract
    get fun get_self_init(): StateInit {
       return initOf SelfTest();
    }
    
    get fun get_self_code(): Cell {
       return codeOf SelfTest;
    }
    
    receive() {}
}
