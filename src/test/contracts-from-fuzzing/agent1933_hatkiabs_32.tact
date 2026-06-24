struct Differ {
  si: Int;
  b: Bool;
}

contract DiffStructs {
  x: Differ;
  y: Differ;

  init() {
    self.x = Differ{ si: 1, b: true };
    self.y = Differ{ si: 2, b: false };
  }
}