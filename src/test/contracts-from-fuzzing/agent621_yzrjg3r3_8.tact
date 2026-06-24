struct OptionalBoolList {
  a: Bool?;
  b: Bool?;
  c: Bool?;
  d: Bool?;
  e: Bool?;
}

contract Test {
  flags: OptionalBoolList;

  init() {
    self.flags = OptionalBoolList{
      a:true, b:null, c:false, d:null, e:true,
    };
  }
}
