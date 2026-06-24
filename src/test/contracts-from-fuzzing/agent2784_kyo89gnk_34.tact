contract OptionalSerial {
 a: Int?;
 b: Bool?;
 c: String?;
 d: Address?;
 e: Int;

 init() {
   self.a = null;
   self.b = null;
   self.c = null;
   self.d = null;
   self.e = 100;
 }
}