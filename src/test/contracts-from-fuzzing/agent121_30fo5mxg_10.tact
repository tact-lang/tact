contract CPContract(param: Int) {}

contract CallerCodeCP {
    receive() {
        // Valid usage of codeOf on a contract with parameters
        let c = codeOf CPContract;
    }
}
