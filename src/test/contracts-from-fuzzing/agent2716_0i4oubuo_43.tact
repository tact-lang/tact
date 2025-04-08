struct HasAll {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: String;
  f: String?;
}
contract AllTypes {
  data: HasAll;
  init() {
    self.data = HasAll{a:1,b:true,c:null,d:false,e:"E",f:null};
  }
}