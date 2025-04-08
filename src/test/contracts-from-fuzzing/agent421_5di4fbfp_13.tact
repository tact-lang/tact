struct Punned {
  val1: Int;
  val2: Int;
}

contract PunningTest {
  rec: Punned;

  init() {
    let val1 = 5;
    let val2 = 10;
    self.rec = Punned{ val1, val2 };
  }
}