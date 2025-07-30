struct Child {
  a: Int? = null;
  b: String = "def";
  c: Bool? = true;
}

struct Parent {
  d: Int = 5;
  e: Bool? = false;
  child: Child = Child{};
}

contract Test {
  p: Parent;

  init() {
    self.p = Parent{};
  }

  receive() {
    self.p = Parent{
      d:10,
      e:true,
      child:Child{a:1,b:"yes",c:false}
    };
  }
}