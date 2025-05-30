struct Compose {
  i: Int;
  s: String;
}

contract TestContract {
  s1: Compose = Compose{ i:1, s:"a" };
  s2: Compose = Compose{ i:2, s:"b" };
  s3: Compose = Compose{ i:3, s:"c" };

  init() {
    self.s1 = Compose{ i:10, s:"x" };
    self.s2 = Compose{ i:20, s:"y" };
    self.s3 = Compose{ i:30, s:"z" };
  }

  receive() {
    let _ = self.s2.s;
  }
}