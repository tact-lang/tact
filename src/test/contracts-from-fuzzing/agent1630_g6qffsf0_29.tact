struct A { f: Int; }
struct B { a: A?; }
contract OptionalNestedStruct {
  val: B?;

  init() {
    self.val = null;
  }
}