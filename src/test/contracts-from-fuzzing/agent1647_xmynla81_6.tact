message(1) M1 {
  val: Int;
}

message(2) M2 {
  m: M1;
  txt: String;
}

contract Test {
  data: M2;

  init() {
    self.data = M2{
      m: M1{val: 5},
      txt: "ok"
    };
  }
}
