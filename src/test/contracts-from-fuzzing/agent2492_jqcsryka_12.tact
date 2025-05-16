struct SubStr {
  intf: Int;
  boolf: Bool;
  strf: String;
}

struct TopStr {
  sub1: SubStr;
  sub2: SubStr;
  val: Int;
}

contract NestedMultiple {
  data: TopStr;
  init() {
    self.data = TopStr{
      sub1: SubStr{intf:1,boolf:true,strf:"x"},
      sub2: SubStr{intf:2,boolf:false,strf:"y"},
      val: 42
    };
  }
}