primitive Int;
trait BaseTrait { }

trait T {
  abstract const Foo: Int;
}

contract TestContract with T {
  override const Foo: Int = 42;
}
