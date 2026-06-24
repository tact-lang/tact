struct Bar {
 x: Int;
}

contract PartialInit {
 foo: Bar;
 bar: Int = 10;

 init() {
  self.foo = Bar{x:5};
 }
}