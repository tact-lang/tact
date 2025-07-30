struct PartialDefaults {
  a: Int = 1;
  b: Int;
}

contract PartialDefaultUsage {
  data: PartialDefaults;

  init() {
    self.data = PartialDefaults{ b: 2 };
  }
}
