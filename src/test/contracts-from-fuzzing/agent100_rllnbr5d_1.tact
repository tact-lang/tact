contract SimpleContract {
    init() {
        // empty initialization
    }
    receive() {}
}

contract Test {
    receive() {
        let initCell = initOf SimpleContract();
        let codeCell = codeOf SimpleContract;
        // trivial usage to compare if codeOf is equivalent to myCode() in current contract
        // But not checking equality here
    }
}
