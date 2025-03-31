struct ContractState { valA: Int; valB: Int }

contract TestGetTuple {
    a: Int = 5;
    b: Int = 10;

    receive() {}

    get fun getTuple(): ContractState? {
        if (self.a < self.b) {
            return ContractState{ valA: self.a, valB: self.b };
        } else {
            return null;
        }
    }
}
