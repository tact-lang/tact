struct ContractState {
    valueA: Int;
    valueB: Int;
}

contract TestTupleStruct {
    receive() {}

    get fun getTuple(): ContractState? {
         return ContractState { valueA: 42, valueB: 100 };
    }
}
