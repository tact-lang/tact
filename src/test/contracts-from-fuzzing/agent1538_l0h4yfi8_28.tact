struct X {
 a: Int;
 b: Bool;
 c: String;
 opt1: Int?;
 opt2: Bool?;
 opt3: String?;
}

contract Test {
 data: X?;

 init() {
   self.data = X{
     a:1, b:true, c:"hi", opt1:null, opt2:false, opt3:null
   };
 }
}