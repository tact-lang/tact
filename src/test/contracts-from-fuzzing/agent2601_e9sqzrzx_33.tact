struct Punned {
  a: Int;
  b: Bool;
}

contract FieldPunning {
    st: Punned;
    init() {
      let a = 7;
      let b = true;
      self.st = Punned{ a, b };
    }
}