// Testing contract with many fields of diverse primitive types
contract TestContract {
  x1: Int = 1;
  x2: Bool = true;
  x3: String = "hi";
  x4: Address; // uninitialized
  x5: Cell;    // uninitialized
  x6: Slice;   // uninitialized

  init() {
    self.x4 = myAddress();
    self.x5 = emptyCell();
    self.x6 = emptyCell().asSlice();
  }
}