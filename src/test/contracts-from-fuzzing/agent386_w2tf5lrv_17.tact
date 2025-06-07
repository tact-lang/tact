struct Child {
  x: Int;
  y: Bool;
}

struct Parent {
  a: Int;
  b: Child;
  c: String;
}

contract ParentTest {
  val: Parent = Parent{a:1, b:Child{x:2,y:false}, c:"hi"};

  init() {
    self.val = Parent{a:5, b:Child{x:10,y:true}, c:"changed"};
  }
}
