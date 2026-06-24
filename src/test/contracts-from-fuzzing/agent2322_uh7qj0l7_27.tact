struct A { val: Int }
struct B { nest: A }

contract PartialInit {
  state: B;

  init() {
    self.state = B{ nest: A{ val: 1 } };
  }
}
