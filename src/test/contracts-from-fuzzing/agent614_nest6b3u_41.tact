struct InnerMost { x:Int; y:String?; }

struct Middle { a:Int; b:InnerMost; }

struct Outer { m: Middle?; flag: Bool; }

contract NestedWrapOpt {
  o: Outer;

  init() {
    self.o = Outer{
      m: Middle{
        a:42,
        b: InnerMost{x:5,y:"foo"}
      },
      flag:true
    };
  }
}