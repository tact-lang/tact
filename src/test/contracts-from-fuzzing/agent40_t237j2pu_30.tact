message CapitalizedField {
  Field: Int;
}

contract Test {
  receive(msg: CapitalizedField) {
    let v = msg.Field;
  }
}