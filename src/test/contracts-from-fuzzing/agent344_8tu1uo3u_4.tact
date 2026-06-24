struct InnerOpt {
  a: Int?;
  b: Bool?;
}

contract TestOpt {
  nested: InnerOpt = InnerOpt{ a: null, b: null };
}