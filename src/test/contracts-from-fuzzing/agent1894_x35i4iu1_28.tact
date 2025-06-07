struct ManyFields {
  a: Int;
  b: Int;
  c: String;
  d: Int?;
  e: Bool;
  f: Bool?;
  g: String?;
  h: Int;
  i: Bool;
  j: String;
}

contract ManyStructFieldsTest {
    s: ManyFields;
    init() {
        self.s = ManyFields{
          a:1,b:2,c:"3",d:null,e:true,f:null,g:null,h:8,i:false,j:"10"
        };
    }
}