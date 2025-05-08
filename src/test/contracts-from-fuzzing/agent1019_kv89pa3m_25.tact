struct Edge {
  num: Int as int257;
  txt: String;
  flag: Bool;
  opt: String?;
  num2: Int as uint1;
}

contract EdgeContract {
  data: Edge;

  init() {
    self.data = Edge{ num:0, txt:"", flag:false, opt:null, num2:1 };
  }
}
