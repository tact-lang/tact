struct Depth1 { a:Int; }
struct Depth2 { inner:Depth1; }
struct Depth3 { inner:Depth2; }
struct Depth4 { inner:Depth3; }

contract DeepNesting {
  d: Depth4;

  init() {
    self.d = Depth4{
      inner: Depth3{
        inner: Depth2{
          inner: Depth1{a:42}
        }
      }
    };
  }
}
