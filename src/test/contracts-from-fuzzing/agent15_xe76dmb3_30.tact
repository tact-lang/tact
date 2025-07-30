message MultipleMessages {}
message MultipleMessagesTwo {}

contract Test {
  receive(message: MultipleMessages) {}
}