contract ParamsDemo(
  x: Int,
  y: Bool,
  z: String,
  a: Int?,
  b: Bool?,
  c: String?,
  addr: Address?,
) {
  receive() { dump(self.x); }
}