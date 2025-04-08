struct NullableNested {
  n: Inner?;
}

struct Inner {
  x: Int;
}

contract NestedOpt {
  data: NullableNested = NullableNested{ n: null };
}