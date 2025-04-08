struct Rich {
  i: Int;
  s: String;
  b: Bool;
  o: Int?;
}

struct Container {
  r1: Rich;
  r2: Rich;
  r3: Rich;
}

contract MultiRich {
  data: Container;

  init() {
    self.data = Container{
      r1: Rich{i:1,s:"a",b:true,o:null},
      r2: Rich{i:2,s:"b",b:false,o:5},
      r3: Rich{i:3,s:"c",b:true,o:null}
    };
  }
}