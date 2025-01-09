primitive Int;
trait BaseTrait { }

trait T {
  abstract const Foo: Int;
}

contract TestContract with T {
  // does not override an abstract const
}
