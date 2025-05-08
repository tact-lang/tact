contract B(n: Int) {
    // Implicit empty init() provided via contract parameters
    receive() {}
}

contract Test1 {
    get fun useInitOf() : Int {
         let si: StateInit = initOf B(42);
         return contractHash(si.code, si.data);
    }
    
    get fun useCodeOf() : Int {
         let c: Cell = codeOf B;
         return contractHash(c, c);
    }
}
