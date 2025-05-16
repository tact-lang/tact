struct Interleaved {
  a: Int;
  b: Bool?;
  c: String;
  d: Address?;
  e: Bool;
}

contract InterleavedFields {
  val: Interleaved;
  init() {
    self.val = Interleaved{a:1,b:null,c:"x",d:null,e:true};
  }
}