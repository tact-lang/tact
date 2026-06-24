struct SOpt {
  foo: Int?;
  bar: Bool;
}

contract DefaultsOptionals {
  data: SOpt;

  init() {
    self.data = SOpt{foo:null, bar:true};
  }
}