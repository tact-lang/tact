struct ContainsContract {
    dummy: Int;
}

contract Embedded {
    field: ContainsContract = ContainsContract{dummy: 5};
}