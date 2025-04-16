// contract with deeply nested optionals
struct X {
  a: Int?;
  b: Y?;
}

struct Y {
  c: String?;
  d: Z?;
}

struct Z {
  e: Bool?;
}

contract DeepOptTest2 {
  val: X;

  init() {
    self.val = X{
      a: null,
      b: Y{
        c: null,
        d: Z{
          e: null
        }
      }
    };
  }
}