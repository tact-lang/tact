message Money {
  value: Int;
}

contract TestContract {
  receive(msg: Money) {
    if (msg.value > 0) {

    }
  }
}