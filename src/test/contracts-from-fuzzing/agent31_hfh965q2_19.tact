struct S {
 a: Int;
 b: Bool;
 c: Int?;
 d: Bool?;
 e: String;
}

contract StorageEdgeCase {
  x: S;
  y: S;

  init() {
    self.x = S{a:0,b:true,c:null,d:null,e:"x"};
    self.y = S{a:1,b:false,c:null,d:null,e:"y"};
  }
}