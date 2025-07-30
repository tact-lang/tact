struct InnerD {
  q: Int = 5;
  r: Bool = true;
}

struct OuterD {
  inner: InnerD = InnerD{};
  z: Int = 10;
}

contract ImplicitInit {
  data: OuterD = OuterD{};
}