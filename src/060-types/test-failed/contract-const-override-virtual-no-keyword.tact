primitive Int;
trait BaseTrait { }

trait T {
  virtual const Foo: Int = 42;
}

contract TestContract with T {
  const Foo: Int = 42;
}
