struct S{a:Int;b:Bool;c:Int?;d:Bool?}
contract Q {
 s:S;
 l:S;
 r:S;
 init() {
   self.s=S{a:1,b:true,c:null,d:false};
   self.l=S{a:2,b:false,c:5,d:true};
   self.r=S{a:9,b:true,c:null,d:null};
 }
}