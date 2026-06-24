// Multiple bool persistent fields, testing compression behavior
contract TestContract {
  b1: Bool = false;
  b2: Bool = true;
  b3: Bool = false;
  b4: Bool = true;
  b5: Bool = false;

  init() {
    self.b1 = true;
    self.b2 = false;
    self.b3 = true;
    self.b4 = false;
    self.b5 = true;
  }
}