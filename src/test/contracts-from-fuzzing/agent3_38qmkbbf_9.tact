contract ChildContract {
    receive() {
    }
}

contract ParentContract {
    childAddress: Address;

    init(childAddress: Address) {
        self.childAddress = childAddress;
    }

    receive() {
        // Using the stored child's address to simulate cross-contract reference
        // Note: Direct calls are asynchronous in Tact.
        dump(self.childAddress);
    }
}
