struct ContractState {
    valueA: Int;
    valueB: Int;
}

contract TestTuple {
    state: ContractState?;

    init() {
        self.state = ContractState{ valueA: 5, valueB: 10 };
    }

    // Getter that returns an optional tuple (represented as a struct) 
    get fun getContractState(): ContractState? {
        return self.state;
    }

    receive() {}
}
