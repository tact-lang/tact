struct OptionalDeepInner {
  flag: Bool;
  note: String?;
}

struct OptionalDeepOuter {
  inside: OptionalDeepInner?;
  count: Int;
}

contract TestContract {
  o: OptionalDeepOuter;
  init() {
    self.o = OptionalDeepOuter{
      inside: null,
      count: 99
    };
  }
}