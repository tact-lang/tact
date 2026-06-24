contract TestSha256 {
  // Testing compile-time evaluation of the sha256 built-in function
  // Expected: A 256-bit hash value evaluated at compile-time, represented as an Int
  const SHA: Int = sha256("hello, world!");

  receive() {
    dump(self.SHA);
  }
}
