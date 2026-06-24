struct Composite1 {
 a: Int; b: Bool; c: String;
}
struct Composite2 {
 d: Int; e: Bool; f: String;
}

contract MultiCompositeFields {
  f1: Composite1;
  f2: Composite2;

  init() {
    self.f1 = Composite1{ a:1, b:true, c:"hi" };
    self.f2 = Composite2{ d:2, e:false, f:"bye" };
  }
}