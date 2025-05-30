contract LazyInit {
    // Lazy initialization: no parameters, no explicit init() function, so an implicit empty init() is generated
    receive() {}
}

contract TestLazyInit {
    // Valid lazy initialization usage: using empty parentheses to obtain the StateInit of LazyInit
    get fun test(): Bool {
         let s: StateInit = initOf LazyInit();
         // Comparing the code field of the StateInit with the code extracted by codeOf
         return s.code == codeOf LazyInit;
    }

    receive() {}
}
