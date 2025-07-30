contract InitParams(
  a: Int,
  b: Bool,
  c: Address,
  d: Int?,
  e: Bool?,
  f: Address?
) {
  receive() {
    dump(self.a);
    dump(self.b);
    dump(self.c);
    dump(self.d);
    dump(self.e);
    dump(self.f);
  }
}