// Compose contract storage using both struct and top-level optionals
struct Data {
  val: Int;
  txt: String?;
}

contract BothOpt {
  topOpt: Data?;
  topNonOpt: Data;
  init() {
    self.topOpt = null;
    self.topNonOpt = Data{ val: 1, txt: null };
  }
}