struct A {
  s1: Int;
  s2: String;
  s3: Bool?;
  s4: Int;
}

struct B {
  a: A;
  s5: String?;
  s6: Bool;
}

contract OptionalsAndNested {
    data: B?; 

    init() {
        self.data = null;
    }
}
