contract Neg(param: Int) {}

contract TestNeg {
    receive() {
        // Testing passing a negative parameter value to a contract with contract parameters
        let s: StateInit = initOf Neg(-42);
        let c: Cell = codeOf Neg;
        let h: Int = contractHash(s.code, s.data);
    }
}
