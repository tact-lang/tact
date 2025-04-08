struct BigStruct {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
  e: String;
  f: Bool?;
  g: Int;
  h: String?;
  i: Int;
  j: Bool;
}

contract HasBigStruct {
  val: BigStruct;

  init() {
    self.val = BigStruct{
      a:1,b:"x",c:true,d:null,e:"",f:false,g:2,h:null,i:3,j:true
    };
  }
}