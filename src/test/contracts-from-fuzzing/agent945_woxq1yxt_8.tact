struct Sub {
  s1: Int;
  s2: Bool;
}

struct Container {
  sub: Sub;
}

contract OptionalStructField {
  optionalContainer: Container?;

  init() {
    self.optionalContainer = Container{
      sub: Sub{ s1: 42, s2: true }
    };
  }
}