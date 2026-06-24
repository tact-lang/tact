struct Rec {
   a: Int;
   b: Sub;
}
struct Sub {
   c: Int;
   d: Sub2;
   e: Bool;
}
struct Sub2 {
   f: Int?;
   g: Sub3;
}
struct Sub3 {
   h: Bool;
   i: String?;
}

contract TestContract {
   save: Rec;

   init() {
     self.save = Rec {
       a: 1,
       b: Sub {
         c:2,
         d: Sub2 {
           f:null,
           g: Sub3 {
             h:true,
             i:"hi"
           }
         },
         e:false
       }
     };
   }
}