message HasOptional {
  a: Int;
  b: Int?;
}

contract Test {
  receive(msg: HasOptional) {
    dump(msg.a);
    let bb = msg.b!!;
  }
}