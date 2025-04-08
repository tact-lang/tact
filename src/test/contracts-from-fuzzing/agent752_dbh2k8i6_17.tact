struct Mid { f: Int; opt: Bool?; txt: String; }

contract StructOptCombo {
  data: Mid;

  init() {
    self.data = Mid{ f: 77, opt: null, txt: "hi" };
  }
}