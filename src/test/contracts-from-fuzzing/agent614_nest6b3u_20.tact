struct Inner {
  name: String;
  value: Int;
  flag: Bool;
}

contract MultiSameType {
  a: Inner;
  b: Inner;
  c: Inner;

  init() {
    self.a = Inner{name:"a",value:1,flag:true};
    self.b = Inner{name:"b",value:2,flag:false};
    self.c = Inner{name:"c",value:3,flag:true};
  }
}