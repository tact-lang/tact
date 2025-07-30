struct Base {
  id:Int;
}
struct Extend {
  b:Base;
  x:Bool;
}

contract StructInStruct {
  val: Extend;
  init(){
    self.val = Extend{ b: Base{ id:4 }, x:true };
  }
}