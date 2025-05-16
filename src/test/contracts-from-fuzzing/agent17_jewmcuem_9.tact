message Transfer {
    amount: Int
}

contract Test {
    receive(msg: Transfer) {}
}