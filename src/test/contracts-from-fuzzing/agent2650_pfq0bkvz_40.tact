struct Container {
 x: Int;
 y: InnerA;
 z: InnerB;
}

struct InnerA { val:Int; flag:Bool; }
struct InnerB { msg:String; opt:Int?; }

contract StorageTest {
 data: Container;
 init() {
  self.data = Container{
    x:42,
    y: InnerA{val: 1, flag:true},
    z: InnerB{msg:"hi", opt:null}
  };
 }
}