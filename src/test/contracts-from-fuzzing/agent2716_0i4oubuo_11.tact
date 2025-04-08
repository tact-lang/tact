struct BigStruct {
  a: Int;
  b: Bool;
  c: String;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int;
  h: Bool;
  i: String;
  j: Int?;
  k: Bool?;
  l: String?;
}

contract BigFields {
  data: BigStruct;

  init() {
    self.data = BigStruct{
      a: 1, b: true, c: "c", d: null, e: false, f: null,
      g:2,h:true,i:"i",j:null,k:true,l:null
    };
  }
}