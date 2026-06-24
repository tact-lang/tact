message Deposit {
    amount: Int
}

message Withdraw {
    amount: Int
}

contract Test {
    receive(msg: Deposit) {}
    receive(msg: Withdraw) {}
}