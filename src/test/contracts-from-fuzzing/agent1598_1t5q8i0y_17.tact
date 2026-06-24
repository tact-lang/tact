// extremely long nested struct with many optional and non-optional fields
struct L {
 a: Int; b: Int?; c: Bool; d: Bool?; e: String; f: String?;
 g: Int; h: Int?; i: Bool; j: Bool?; k: String; l: String?;
 m: Int; n: Int?; o: Bool; p: Bool?; q: String; r: String?;
}

contract LongNestedField {
 field: L = L{
  a:1,b:null,c:true,d:null,e:"a",f:null,
  g:2,h:null,i:false,j:null,k:"b",l:null,
  m:3,n:null,o:true,p:null,q:"c",r:null
 };

 init() {
  self.field = L{
    a:4,b:5,c:false,d:true,e:"x",f:"y",
    g:6,h:7,i:true,j:false,k:"z",l:"w",
    m:8,n:9,o:false,p:true,q:"q",r:"r"
  };
 }
}