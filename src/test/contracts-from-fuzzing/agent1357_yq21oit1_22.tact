contract ParamMixed(
  a: Int
) {
  const K: Int = 5;
  fun f() {
    let x = 9;
    dump(x + self.K + self.a);
  }
}