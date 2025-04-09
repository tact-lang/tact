contract A {
    receive() {}
}

contract Test {
    // Valid usage of initOf and codeOf
    get fun test() : Int {
         let initPkg: StateInit = initOf A();
         let code: Cell = codeOf A;
         // Compute a simple hash sum of both cells
         return contractHash(initPkg.code, initPkg.data) + contractHash(code, code);
    }
}
