message WithOptional {
    maybeAmount: Int?
}

contract Test {
    receive(msg: WithOptional) {}
}