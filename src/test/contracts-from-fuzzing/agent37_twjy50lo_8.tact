struct ContractState {
    valueA: Int;
    valueB: Int;
}

contract TestTuple {
    state: ContractState = ContractState { valueA: 10, valueB: 20 };
    
    receive() {}
    
    get fun getState(): ContractState {
        return self.state;
    }
}
