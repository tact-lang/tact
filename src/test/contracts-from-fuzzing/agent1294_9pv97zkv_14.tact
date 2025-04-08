struct InnerMost {
  num: Int?;
}

struct Mid {
  inner: InnerMost?;
}

contract DeepNulls {
  field: Mid = Mid{ inner: InnerMost{ num: null } };
  receive() {}
}