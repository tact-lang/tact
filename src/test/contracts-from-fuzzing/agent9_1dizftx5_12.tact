message Data {
  a: Int;
}

contract Test {
  receive(msg: Data) {
    let d: Data = Data { a: 5 };
    dump(d.a);
  }
}