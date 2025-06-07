struct Layer1 { x:Int; y:Bool; }
struct Layer2 { inner: Layer1; z: String; }
struct Layer3 { in2: Layer2; f: Bool; }

contract StackThree {
  val: Layer3;

  init() {
    self.val = Layer3{
      in2:Layer2{
        inner:Layer1{x:123,y:true},
        z:"ok"
      },
      f:false
    };
  }
}