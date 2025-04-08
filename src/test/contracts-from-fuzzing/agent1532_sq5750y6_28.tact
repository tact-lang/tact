struct X { a:Int; b:Int; }
struct Y { c:Int; d:Int; }
struct Z { e:X; f:Y; g:Int; h:String; }

contract CrossNested {
  val:Z;

  init() {
    self.val = Z{
      e:X{a:1,b:2},
      f:Y{c:3,d:4},
      g:5,
      h:"abc",
    };
  }
}