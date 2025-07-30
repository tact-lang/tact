message(505) Msg {
  info: Int = 100;
}

struct Level2 {
  m: Msg?;
  note: String = "hi";
}

struct Level1 {
  l2: Level2?;
  flag: Bool = true;
}

contract Test {
  data: Level1;

  init() {
    self.data = Level1{
      l2: Level2{
        m: null,
        note: "custom"
      },
      flag: false
    };
  }

  receive() {
    if (self.data.l2 != null && self.data.l2!!.m != null) {
      let _ = self.data.l2!!.m!!.info;
    }
  }
}