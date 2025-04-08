struct OneLevel {
  a: Int;
  b: String;
  c: Bool;
  d: Cell;
}

contract TestContract {
  var1: Int;
  var2: String;
  var3: Bool;
  var4: OneLevel;

  init() {
    self.var1 = 1;
    self.var2 = "hi";
    self.var3 = false;
    self.var4 = OneLevel{ a: 10, b: "x", c: true, d: emptyCell() };
  }
}