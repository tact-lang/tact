struct ContractState {
    valueA: Int;
    valueB: Int;
}

contract TestStructGetter {
    v: Int = 10;
    w: Int = 20;

    receive() {}

    // getter returning a struct (simulating a tuple return)
    get fun getContractState(): ContractState? {
        return ContractState{
            valueA: self.v,
            valueB: self.w
        };
    }
}
