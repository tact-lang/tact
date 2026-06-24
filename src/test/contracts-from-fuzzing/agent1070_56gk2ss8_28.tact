struct DefStruct {
  x: Int = 5;
  y: String = "hi";
}

contract DefTest {
  s: DefStruct;

  init() {
    self.s = DefStruct{
      x: 42,
      y: "ok"
    };
  }
}