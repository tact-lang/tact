struct SOpt {
  foo: Int?;
  bar: String;
}

contract DefaultOpt {
  s: SOpt;

  init(){
    self.s = SOpt{
      foo: null,
      bar: "hello"
    };
  }
}