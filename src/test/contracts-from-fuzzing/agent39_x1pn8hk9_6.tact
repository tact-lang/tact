contract CommaContract(arg: Int) {
    // No explicit init; using delayed implicit empty init
}

contract CommaCaller {
    receive() {
        let s = initOf CommaContract(
            456,
        );
        let addr = contractAddress(s);
    }
}
