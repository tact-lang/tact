struct Sparse {
  a: Int?;
  b: Int?;
  c: Int?;
  d: Int?;
  e: Int?
}

contract SparseStore {
  val: Sparse = Sparse{ b: 2, d: 4 };
  receive() {}
}