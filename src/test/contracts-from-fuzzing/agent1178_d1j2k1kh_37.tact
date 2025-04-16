// wrap string and int, then wrap as an optional struct
struct SI { s: String; i: Int; }
struct Wrap {
  si: SI?;
  x: Bool;
}

contract Test {
  state: Wrap;
  init() {
    self.state = Wrap{
      si: SI{s: "a", i:1},
      x: true
    };
  }
}