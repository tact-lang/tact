struct SNested {
  val: Int;
}

struct TopOpt {
  inner1: SNested?;
  inner2: SNested?;
  inner3: SNested?;
}

contract ManyNestedOpts {
  nest: TopOpt;

  init() {
    self.nest = TopOpt{
      inner1:null,
      inner2:null,
      inner3:null
    };
  }
}