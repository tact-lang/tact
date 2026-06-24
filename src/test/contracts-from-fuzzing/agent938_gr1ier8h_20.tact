struct Chain {
  a: Int;
  b: Int?;
  c: Int;
  d: Int?;
  e: Int;
  f: Int?;
}

contract ManyOptionInt {
    chain: Chain;

    init() {
        self.chain = Chain{
            a:1,b:null,c:2,d:null,e:3,f:null
        };
    }
}
