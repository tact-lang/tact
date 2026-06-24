// Use default value inside nested struct
struct DefInner {
  n: Int = 5;
}

struct DefOuter {
  i: DefInner;
}

contract DefNested {
  data: DefOuter;
  init() {
    self.data = DefOuter{ i: DefInner{} };
  }
}
