struct ContractState {
    valueA: Int;
    valueB: Int;
}

contract TestTuple {
    receive() {}

    get fun getTuple(): ContractState? {
         return ContractState { valueA: 10, valueB: 20 };
    }
}
