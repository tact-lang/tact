struct ContractState {
    valueA: Int;
    valueB: Int;
}

contract CorrectTupleGetter {
    receive() {}

    get fun getTuple(): ContractState? {
        return ContractState{ valueA: 123, valueB: 456 };
    }
}
