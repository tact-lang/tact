struct Foo {
 x: Int;
 y: Int?;
 z: Bool;
}

contract DefaultsOpt {
 f: Foo;

 init() {
   self.f = Foo{
     x: 42,
     y: null,
     z: false,
   };
 }
}