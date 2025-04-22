primitive Int;
trait BaseTrait {}

struct A0 {
  b: A1;
}

struct A1 {
  a: Int;
  b: A2;
}

struct A2 {
  a: Int;
  b: A1?;
}
