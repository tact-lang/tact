struct Foo { a: Int; }
struct Bar { b: Bool; }

contract MultiOptNested {
  foo: Foo? = null;
  bar: Bar? = null;
  message: String = "";
}
