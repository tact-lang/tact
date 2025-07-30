// deeply nested multiple optional and defaults
struct Leaf {
  a:Int=123;
  opt:Int?;
}
struct Branch {
  left:Leaf?;
  right:Leaf;
}
struct Root {
  a:Branch?;
  b:Branch;
}
contract DeepMix {
  data:Root;
  init() {
    self.data=Root{
      a:null,
      b:Branch{
        left:null,
        right:Leaf{}
      }
    };
  }
}