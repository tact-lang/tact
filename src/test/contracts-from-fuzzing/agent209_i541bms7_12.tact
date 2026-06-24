// Contract with deeply nested optional String
struct Third {
  s: String?;
}

struct Second {
  t: Third?;
}

struct First {
  s: Second?;
}

contract OptStringNest {
  data: First;

  init() {
    self.data = First{
      s: Second{
        t: Third{
          s: "deep"
        }
      }
    };
  }
}