struct Deep {
 a: Int;
 b: Inner;
}

struct Inner {
 c: Int;
 d: Inner2;
}

struct Inner2 {
 e: Int;
 f: Inner3;
}

struct Inner3 {
 g: Int;
 h: Bool;
 i: String;
}

contract DeepNest {
 persistent: Deep;

 init() {
   self.persistent = Deep {
     a: 1,
     b: Inner {
       c: 2,
       d: Inner2 {
         e: 3,
         f: Inner3 {
           g: 4,
           h: true,
           i: "yo"
         }
       }
     }
   };
 }
}