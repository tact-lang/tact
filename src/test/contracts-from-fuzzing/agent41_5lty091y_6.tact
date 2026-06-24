struct Inner {
  value: Int
}

struct Outer {
  inner: Inner
}

fun create_inner(value: Int): Inner {
  return Inner{ value: value };
}

contract Test {
  receive() {
    let inner = create_inner(1);
  }
}