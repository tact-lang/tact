struct ContractState {
    valueA: Int;
    valueB: Int;
}

contract TestTupleGetter {
    receive() {}

    // Getter returning a tuple represented as an optional struct
    get fun getTuple(): ContractState? {
        return ContractState{ valueA: 10, valueB: 20 };
    }
}
