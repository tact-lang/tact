struct Inner {
  v: Int;
}

struct Middle {
  inr: Inner?;
}

contract Test {
  m: Middle = Middle { inr: null };
}