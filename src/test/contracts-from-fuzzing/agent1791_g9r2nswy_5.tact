struct S3 {
  n: Int;
  optStr: String?;
}

contract Test6 {
  a: S3 = S3{ n: 12, optStr: null };
  init() {}
}
