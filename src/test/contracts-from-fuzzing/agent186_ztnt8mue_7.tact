struct InnerOpt {
  id: Int?;
  txt: String?;
}

struct Outer {
  nested: InnerOpt;
  flag: Bool;
}

contract TestContract {
  data: Outer;
  init() {
    self.data = Outer{ nested: InnerOpt{ id:null, txt:"hi" }, flag:true };
  }
}