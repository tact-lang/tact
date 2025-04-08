struct Leaf { v:Int; }

struct Node1 { l:Leaf; }
struct Node2 { n:Node1; }
struct Node3 { n:Node2; }
struct Node4 { n:Node3; }
struct Node5 { n:Node4; }

contract TreeContract {
  tree:Node5;
  init() {
    self.tree=Node5{n:Node4{n:Node3{n:Node2{n:Node1{l:Leaf{v:42}}}}}};
  }
}