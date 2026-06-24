struct BigStructOpt {
  a: Int;
  b: Bool;
  c: String;
  d: Address?;
  e: Slice?;
  f: Cell?;
}

contract WrappedOpt {
  rec: BigStructOpt;

  init() {
    self.rec = BigStructOpt{ a:1,b:true,c:"hi",d:null,e:null,f:null };
  }
}
