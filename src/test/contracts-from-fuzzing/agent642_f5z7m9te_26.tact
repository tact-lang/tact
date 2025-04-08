// nested deeply and wrapped in optionals, multilevel
struct Leaf { val: Int }
struct NodeLevel2 {
  leaf: Leaf?;
}
struct NodeLevel1 {
  child: NodeLevel2?;
}

contract DeepOptTest {
  root: NodeLevel1?;

  init() {
    self.root = null;
  }
}