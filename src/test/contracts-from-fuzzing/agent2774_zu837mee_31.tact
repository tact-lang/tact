// test optional Message inside persistent struct
message(0xabc123) Msg { k: Int }

struct Wrap {
  val: Msg?;
}

contract TestContract {
  data: Wrap;

  init() {
    self.data = Wrap{
      val: null
    };
  }
}