contract IntVariety {
 a: Int as int8;
 b: Int as uint8;
 c: Int as int16;
 d: Int as uint32;
 e: Int as coins;
 
 init() {
   self.a = -2;
   self.b = 200;
   self.c = 1000;
   self.d = 123456;
   self.e = ton("1");
 }
}