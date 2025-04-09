contract ManyPrimitive {
 a: Int;
 b: Bool;
 c: String;
 d: Address;
 e: Int?;
 f: Bool?;
 g: String?;
 h: Address?;

 init() {
   self.a = 1;
   self.b = false;
   self.c = "s";
   self.d = myAddress();
   self.e = null;
   self.f = null;
   self.g = null;
   self.h = null;
 }
}