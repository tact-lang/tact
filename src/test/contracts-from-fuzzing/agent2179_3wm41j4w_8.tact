contract DefaultsAndInit {
  val1: Int = 5;
  optVal: Int?; 
  txt: String = "hi";

  init() {
    self.optVal = null;
    self.txt = "there";
  }
}