// nested with serialization modifiers
struct LeafSer {
  a: Int as uint32;
  b: Int as int64;
  flag: Bool;
}

struct BranchSer {
  l: LeafSer;
  r: LeafSer;
}

contract NestedSerTest {
  root: BranchSer;
  init() {
    self.root = BranchSer{
      l: LeafSer{a:1,b:2,flag:true},
      r: LeafSer{a:3,b:4,flag:false}
    };
  }
}
