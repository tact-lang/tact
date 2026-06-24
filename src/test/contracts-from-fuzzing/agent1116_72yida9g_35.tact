// optional param of nested struct with nested optional field
contract MixParam(
  foo: Outer?,
) {}

struct Inner {
   v: Int?; 
}

struct Outer {
   inner: Inner;
}
