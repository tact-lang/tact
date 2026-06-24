contract C(param: Int) {}

contract TestContractC {
    receive() {
        // Testing initOf and codeOf on a contract with parameters
        // According to docs, a contract with parameters doesn't have an init() function, so this usage might be ambiguous
        // In our current implementation, we try to generate a StateInit from the contract parameters
        let si = initOf C(42);
        let addr = contractAddress(si);
        let cc: Cell = codeOf C;
        dump(addr);
        dump(cc);
    }
}
