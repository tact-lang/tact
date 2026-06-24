struct Inner {
  x: Int;
}

struct Middle {
  inner: Inner?;
}

contract DeepOptional {
  field: Middle? = null;
}