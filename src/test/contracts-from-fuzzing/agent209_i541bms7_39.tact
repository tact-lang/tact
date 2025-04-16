// Deep optional chain but with Node1 not empty
struct Node4 { next: Node3?; }
struct Node3 { next: Node2?; }
struct Node2 { next: Node1?; }
struct Node1 { v: Int; }

contract ChainOptNotEmpty {
  root: Node4;

  init() {
    self.root = Node4{
      next: Node3{
        next: Node2{
          next: Node1{v: 555}
        }
      }
    };
  }
}