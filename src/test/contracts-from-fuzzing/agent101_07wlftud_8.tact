contract EmptyContract {}

contract TestEmpty {
    init() {}
    
    receive() {
        // Testing initOf on a contract with no explicit parameters (implicit empty init)
        let s = initOf EmptyContract();
        let c = codeOf EmptyContract;
    }
}
