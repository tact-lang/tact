struct Foo {
 a: Int;
}

contract FooWrap {
 f: Foo;

 init() {
   self.f = Foo{a:10};
 }
}