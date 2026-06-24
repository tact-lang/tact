struct StrOpt {
  s: String?;
}

struct Container {
  one: StrOpt;
  two: StrOpt;
}

contract StrInStructs {
  data: Container;

  init() {
    self.data = Container{
      one: StrOpt{s:null},
      two: StrOpt{s:null},
    };
  }
}