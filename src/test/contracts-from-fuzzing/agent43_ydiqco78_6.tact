struct ContractState {
    valueA: Int;
    valueB: Int;
}

contract Test {
    // state variable as an optional ContractState, defaulting to null
    state: ContractState? = null;

    // Getter returning an optional ContractState
    get fun getState(): ContractState? {
        return self.state;
    }

    receive() {}
}
