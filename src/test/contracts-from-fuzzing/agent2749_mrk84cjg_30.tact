struct BigNested {
  a: Int;
  b: String;
  c: Bool;
  d: String?;
  e: Int?;
  f: Bool?;
}

struct Container {
  nested: BigNested;
}

contract MoreNesting {
  c: Container;

  init() {
    self.c = Container{
      nested: BigNested{
        a:1,b:"s",c:true,d:null,e:null,f:null
      }
    };
  }
}