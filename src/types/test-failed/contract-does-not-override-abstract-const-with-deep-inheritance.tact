primitive Int;
trait BaseTrait { }

trait T {
  abstract const Foo: Int;
}

trait T1 with T {}

contract TestContract with T1 {
  // does not override an abstract const
}
