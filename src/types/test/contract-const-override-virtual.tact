primitive Int;
trait BaseTrait { }

trait T {
   virtual const Foo: Int = 41;
}

contract TestContract with T {
  override const Foo: Int = 42;
}
