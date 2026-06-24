struct DeepNest {
 a:Int;
 b:Inner;
}

struct Inner {
 c:Int;
 d:Inner2;
}

struct Inner2 {
 e:Int;
 f:Inner3;
}

struct Inner3 {
 g:Int;
 h:Inner4;
}

struct Inner4 {
 i:Int;
}

contract DeepFields {
 s:DeepNest;
 init() {
   self.s=DeepNest{
     a:1,
     b:Inner{
       c:2,
       d:Inner2{
         e:3,
         f:Inner3{
           g:4,
           h:Inner4{ i:5 }
         }
       }
     }
   };
 }
}