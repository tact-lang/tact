struct Mix {
  intField: Int;
  boolField: Bool;
  optIntField: Int?;
  strField: String;
  optStrField: String?;
}

contract Comb {
  data: Mix;

  init() {
    self.data = Mix{
      intField:1,
      boolField:true,
      optIntField:null,
      strField:"hello",
      optStrField:null
    };
  }
}