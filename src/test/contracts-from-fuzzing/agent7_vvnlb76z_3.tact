struct ContractState {
    valueA: Int;
    valueB: Bool;
}

contract TestCompositeGetter {
    state: ContractState = ContractState{
        valueA: 1,
        valueB: true
    };
    
    receive() {}
    
    get fun getComposite(): ContractState {
        return self.state;
    }
}
