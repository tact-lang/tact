struct NestedA { i:Int; }
struct NestedB { b:Bool; }

struct ContainsBoth {
  a: NestedA;
  b: NestedB;
}

contract NestedSplitTypes {
  val: ContainsBoth;
  init() {
    self.val = ContainsBoth{ a:NestedA{i:5}, b:NestedB{b:true} };
  }
}