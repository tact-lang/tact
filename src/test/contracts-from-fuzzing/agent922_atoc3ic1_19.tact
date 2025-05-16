struct Foo { a:Int; b:Bool; c:String; d:Int? }
struct Bar { x:Foo; y:Foo? }

contract TestContract {
    one: Foo;
    two: Bar;

    init() {
      self.one = Foo{ a:1,b:true,c:"hi",d:null };
      self.two = Bar { x:self.one, y:null };
    }
}