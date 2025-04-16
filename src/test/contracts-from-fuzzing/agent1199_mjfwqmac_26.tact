contract Test26 {
  x: Int;
  y: String;
  z: Bool;
  optX: Int?;
  optY: String?;
  optZ: Bool?;
  data: Cell;
  text: String;

  init() {
    self.x = 1;
    self.y = "hi";
    self.z = false;
    self.optX = null;
    self.optY = null;
    self.optZ = null;
    self.data = emptyCell();
    self.text = "";
  }
}