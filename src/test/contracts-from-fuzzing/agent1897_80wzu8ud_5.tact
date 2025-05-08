struct DeepOptionals {
  a: InnerOptionals?;
}

struct InnerOptionals {
  b: Core?;
}

struct Core {
  x: Int?;
  y: Bool?;
  s: String?;
}

contract DeepOptionalsContract {
  val: DeepOptionals;

  init() {
    self.val = DeepOptionals{
      a: InnerOptionals{
        b: Core{
          x: null,
          y: null,
          s: null
        }
      }
    };
  }
}
