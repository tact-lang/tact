struct SetGetStruct {
  x: Int;
  y: Int;
}

contract SetGetTest {
  data: SetGetStruct;

  init() {
    self.data = SetGetStruct{ x: 5, y: 10 };
  }

  get fun sum(): Int {
    return self.data.x + self.data.y;
  }
}