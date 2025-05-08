struct InnerInner {
  x: Int;
  flag: Bool;
}

struct Inner {
  inn: InnerInner;
  name: String;
}

contract ParamDeepNest(
  inside: Inner,
  count: Int,
  name: String,
) {}