struct SparseTypes {
  a: Int;
  b: String;
  c: Bool;
  d: Address;
}

contract SparseFields {
  sa: SparseTypes;

  init() {
    self.sa=SparseTypes{ a:1, b:"hi", c:true, d: myAddress() };
  }
}