message WithOptionalMsg {
  foo: Int?
}

contract Test {
  receive(message: WithOptionalMsg) {}
}