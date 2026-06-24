contract TestContract {
  num: Int;
  opt: Int?;
  flag: Bool;
  txt: String;
  addr: Address;

  init() {
    self.num = 1;
    self.opt = null;
    self.flag = false;
    self.txt = "test";
    self.addr = myAddress();
  }
}