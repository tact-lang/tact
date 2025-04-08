// Very deep nested optional struct chain *with* initial nestings at contract level
struct A { b: B?; }
struct B { c: C?; }
struct C { d: Int?; }

contract AssignDeepOpt {
  root: A?;

  init() {
    self.root = A{ b: B{ c: C{ d: null } } };
  }
}
