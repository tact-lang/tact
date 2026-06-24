struct ManyFields {
 a: Int;
 b: Int;
 c: Int;
 d: Int;
 e: Int;
 f: Int;
 g: Bool;
 h: Bool;
 i: Bool;
 j: Int;
 k: Bool;
}

contract LargeStruct {
 val: ManyFields;
 init() {
  self.val = ManyFields{
   a:1, b:2, c:3, d:4, e:5, f:6, g:true, h:false, i:true, j:7, k:false
  };
 }
}