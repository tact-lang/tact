message(11) Msg {
  code: Int;
  note: String?;
}

struct Container {
  inner: Msg?;
  tag: String;
  flag: Bool?;
}

contract Test {
  store: Container;

  init() {
    self.store = Container{
      inner: Msg{code: 777, note: "nice"},
      tag: "TAG",
      flag: true
    };
  }
}
