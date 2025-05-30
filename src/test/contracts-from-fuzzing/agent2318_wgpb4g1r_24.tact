struct Optional1 {
  f1: Int?;
  f2: Bool?;
}

struct Optional2 {
  inner1: Optional1?;
  s: String?;
}

struct Optional3 {
  inner2: Optional2?;
  flag: Bool;
}

contract TestContract {
  data: Optional3 = Optional3{
    inner2: null,
    flag: false
  };

  init() {
    self.data = Optional3{
      inner2: Optional2{
        inner1: Optional1{
          f1: 99,
          f2: true
        },
        s: "hello"
      },
      flag: true
    };
  }
}
