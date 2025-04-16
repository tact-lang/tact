struct ManyOptionals {
 a: Int?;
 b: Int?;
 c: Bool?;
 d: String?;
 e: Int?;
 f: Bool?;
 g: String?;
}

contract TestContract {
 bigOpt: ManyOptionals;

 init() {
   self.bigOpt = ManyOptionals{
    a:null,b:null,c:null,d:null,e:null,f:null,g:null
   };
 }
}