struct Flag {
  f1: Bool;
  f2: Bool;
  f3: Bool;
}

struct Mid {
  innerFlag: Flag;
}

struct Top {
  nested: Mid;
  note: String;
}

contract Test {
  state: Top;

  init() {
    self.state = Top{
      nested: Mid{
        innerFlag: Flag{ f1:true, f2:false, f3:true }
      },
      note:"hi"
    };
  }
}
