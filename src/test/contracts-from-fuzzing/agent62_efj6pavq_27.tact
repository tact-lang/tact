struct FlatNested {
 a: Int;
 b: Bool;
 c: String;
 d: Int?;
 e: String?;
 f: Bool?;
}

contract FlatNestedTest {
 fstore: FlatNested;
 init() {
  self.fstore=FlatNested{
    a:1,b:true,c:"x",d:null,e:null,f:null
  };
 }
}
