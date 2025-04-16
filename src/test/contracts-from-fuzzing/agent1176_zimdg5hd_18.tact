struct A { a: Int; }
struct B { b: Bool?; }

contract ParamMega(
  i: Int,
  f: Bool,
  t: String,
  addr: Address?,
  optInt: Int?,
  sa: A,
  sb: B?,
) {
  receive() {
    self.i + 1;
  }
}