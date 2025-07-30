struct BigStruct {
 a: Int;
 b: Bool;
 c: String;
 d: Int?;
 e: Bool?;
 f: String;
 g: Int;
 h: Bool;
 i: String;
 j: Int?;
 k: String;
}

contract Test {
 field: BigStruct;

 init() {
   self.field = BigStruct{
     a:1, b:true, c:"c", d:null, e:null, f:"f", g:7, h:false, i:"i", j:null, k:"k"
   };
 }
}