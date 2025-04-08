struct Child { val: Int }
struct Parent { item: Child? }

contract OptNestSomeInit {
  rec: Parent;

  init() {
    self.rec = Parent{
      item: Child{ val: 42 }
    };
  }
}
