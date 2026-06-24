contract D(x: Int) {
    receive() {}
    
    // Using initOf with parameters. Should compile: initOf D(5) returns StateInit, and codeOf D returns the contract code.
    get fun verify(): Bool {
         let pkg = initOf D(5);
         return codeOf D == pkg.code;
    }
}
