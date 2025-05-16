struct ContractState {
    valueA: Int;
    valueB: Int;
}

contract StatefulContract {
    a: Int = 10;
    b: Int = 20;

    receive() {}

    // Getter returning a tuple represented as a struct (as per documentation )
    get fun get_state() : ContractState? {
        return ContractState{
            valueA: self.a,
            valueB: self.b
        };
    }
}
