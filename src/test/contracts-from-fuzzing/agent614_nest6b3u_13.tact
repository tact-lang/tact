struct Info { s: String; }

contract OptStructField {
  opt: Info?;
  num: Int;

  init() {
    self.opt = null;
    self.num = 10;
  }
}