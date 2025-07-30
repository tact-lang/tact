// struct with nested optionals as parameter
struct Inner {
  val: Int?;
}

struct Outer {
  inner: Inner?;
}

contract Test(foo: Outer) {}