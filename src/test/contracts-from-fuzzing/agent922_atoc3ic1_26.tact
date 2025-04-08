struct Foo {a:Int;b:Bool?;c:String?}

struct Bar {x:Foo;y:Foo;z:Foo}

contract QB {
  val:Bar;
  init() {
    self.val = Bar{
      x:Foo{a:1,b:true,c:"hi"},
      y:Foo{a:2,b:null,c:null},
      z:Foo{a:3,b:false,c:"bye"}
    };
  }
}