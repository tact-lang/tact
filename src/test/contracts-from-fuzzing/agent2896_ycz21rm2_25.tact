contract MixedSerialOptional {
 a: Int as uint3;
 b: Int as int5;
 c: Int?;
 d: Bool?;
 e: String?;

 init() {
  self.a = 3;
  self.b = -2;
  self.c = 15;
  self.d = null;
  self.e = "hello";
 }
}