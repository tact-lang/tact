contract DefaultsVsInit {
  val: Int = 5;
  txt: String = "ok";

  init() {
    self.val = 100;
    self.txt = "no";
  }
}
