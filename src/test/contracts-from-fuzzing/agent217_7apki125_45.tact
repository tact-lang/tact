struct Inner {
  a: Int;
  b: String;
}

struct Wrapper {
  inner: Inner?;
}

contract OptStructParam(
  wrap: Wrapper?,
  num: Int,
) {}