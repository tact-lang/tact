struct Foo {
  a:Int;
  b: Bool;
}

contract Wrong {
  foo: Foo;
  init() {
    self.foo = Foo{ a:1,b:true };
  }
  get fun bar():Foo{
    return self.foo;
  }
}