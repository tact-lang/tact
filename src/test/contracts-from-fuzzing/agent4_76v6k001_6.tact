contract ChildContract {
    get fun childValue(): Int {
         return 55;
    }
    receive() {}
}

contract ParentContract {
    childAddress: Address;
    init() {
        // Correct usage using contractAddress to get the child's address
        self.childAddress = contractAddress(initOf ChildContract());
    }
    get fun getChildValue(): Int {
        // Simulated chain: Instead of a direct call, we simply return the child value
        return 55;
    }
    receive() {}
}
