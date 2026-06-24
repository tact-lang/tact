contract CombinationOptionalSerialization {
 a: Int as int16;
 b: Int?;
 c: Bool?;
 d: String?;

 init() {
  self.a = 123;
  self.b = null;
  self.c = true;
  self.d = null;
 }
}