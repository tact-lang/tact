struct WithStr {
  text: String;
}

struct WithBool {
  flag: Bool;
}

contract Test {
  s: WithStr;
  b: WithBool;
  
  init() {
    self.s = WithStr{ text:"hello" };
    self.b = WithBool{ flag:true };
  }
}
