struct DeepCombo {
  a: Int; 
  b: Bool?;
  c: String;
  d: Int?;
}

struct Wrapper {
  field: DeepCombo;
}

contract ComboFields {
  data: Wrapper;

  init() {
    self.data = Wrapper{
      field: DeepCombo{
        a: 1,
        b: null,
        c: "x",
        d: null
      }
    };
  }
}
