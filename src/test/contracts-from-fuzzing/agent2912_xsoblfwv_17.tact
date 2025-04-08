struct SFirst {
  a: Int;
}

struct SSecond {
  b: Int;
}

struct SMerged {
  s1: SFirst;
  s2: SSecond;
}

contract NestedComposed {
  all: SMerged;
  init() {
    self.all = SMerged{ s1: SFirst{ a:1 }, s2: SSecond{ b:2 } };
  }
}