struct ContainsNulls {
  optInt: Int?;
  optBool: Bool?;
}

contract ManyOptionals {
  a: ContainsNulls;
  b: ContainsNulls;

  init() {
    self.a = ContainsNulls{ optInt:null, optBool:null };
    self.b = ContainsNulls{ optInt:null, optBool:null };
  }
}
