struct A { x: Int; y: Bool; }
struct B { b1: Int; optA: A?; }
struct C { c1: Bool; b:B; optB: B?; }

contract OptionalMiddle {
  state: C;
  init() {
    self.state = C{
      c1: true,
      b: B{b1:5,optA:null},
      optB: null
    };
  }
}
