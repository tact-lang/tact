struct A { f1:Int; }
struct B { f2:String; a:A; }
struct C { f3:Bool; b:B; }

contract NestDeep {
  root:C;
  init(){
    self.root = C{
      f3:true,
      b:B{
        f2:"abc",
        a:A{f1:77}
      }
    };
  }
}