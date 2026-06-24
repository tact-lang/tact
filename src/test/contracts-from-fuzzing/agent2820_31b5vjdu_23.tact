contract ConstInits {
  const BASE: Int = 10;
  const FLAG: Bool = true;

  x: Int = self.BASE + 5;
  y: Bool = !self.FLAG;

  init() {}
}