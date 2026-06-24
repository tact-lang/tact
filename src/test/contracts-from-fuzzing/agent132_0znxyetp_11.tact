contract C(x: Int) {
    receive() {}
}

contract TestTrailingComma {
    get fun test() : Int {
         let si: StateInit = initOf C(7,);
         let c: Cell = codeOf C;
         return contractHash(si.code, si.data) + contractHash(c, c);
    }
}
