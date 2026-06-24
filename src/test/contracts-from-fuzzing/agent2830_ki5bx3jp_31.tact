// Test optional struct default null assignment
struct Foo {
  value: Int;
}
contract OptStruct {
  data: Foo?;
  init() {}
}