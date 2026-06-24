struct DeepNest1 { a: Int }
struct DeepNest2 { d1: DeepNest1 }
struct DeepNest3 { d2: DeepNest2 }
struct DeepNest4 { d3: DeepNest3 }
struct DeepNest5 { d4: DeepNest4 }

contract Test {
  data: DeepNest5;
  init() {
    self.data = DeepNest5{ d4: DeepNest4{ d3: DeepNest3{ d2: DeepNest2{ d1: DeepNest1{ a: 42 } } } } };
  }
}