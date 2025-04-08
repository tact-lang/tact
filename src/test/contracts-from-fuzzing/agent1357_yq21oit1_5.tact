struct Inner {
  a: Int;
  b: Bool?;
}

struct Outer {
  inner: Inner;
  text: String?;
}

contract DeeplyNested {
  data: Outer = Outer{ inner: Inner{ a: 7 }, text: null };
}