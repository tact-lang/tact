// Edge case: default string in nested struct
struct SInner {
  txt: String = "default";
}

struct SOuter {
  s: SInner;
}

contract DefaultStringNested {
  data: SOuter;

  init() {
    self.data = SOuter{ s: SInner{} };
  }
}