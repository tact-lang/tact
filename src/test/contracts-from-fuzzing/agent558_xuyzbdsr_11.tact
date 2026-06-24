struct InnerOpt {
  a: Int?;
}

struct OuterOpt {
  inn: InnerOpt?;
}

contract Test {
  v: OuterOpt = OuterOpt{ inn: null };
}