// test optional struct as persistent
struct EmbeddedOpt {
   x:Int;
   y:Int?;
}

contract OptStructField {
   data: EmbeddedOpt?;

   init() {
     self.data = null;
   }
}
