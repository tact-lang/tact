struct Foo { x:Int; y:Int } 
struct Bar { a:Foo; b:Foo; c:Foo }
contract ManyStructs {
  structdata: Bar;
  init() {
    self.structdata=Bar{
      a:Foo{ x:1, y:2 },
      b:Foo{ x:3, y:4 },
      c:Foo{ x:5, y:6 },
    };
  }
}