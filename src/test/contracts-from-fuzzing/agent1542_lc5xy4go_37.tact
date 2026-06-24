struct NestedOpt {
  o: Int?;
}

struct OuterOptWrap {
  w: NestedOpt?;
}

contract OptOptOpt {
  data: OuterOptWrap;

  init() {
    self.data = OuterOptWrap{w:null};
  }
}