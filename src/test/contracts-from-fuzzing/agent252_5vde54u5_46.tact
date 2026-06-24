struct Mix {
 a: Int;
 b: Int?;
 c: Bool;
 d: String?;
}

contract MixTest {
 val: Mix;
 init(){
   self.val=Mix{a:10,b:null,c:true,d:null};
 }
}