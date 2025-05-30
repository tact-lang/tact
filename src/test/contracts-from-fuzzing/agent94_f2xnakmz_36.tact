contract MixedSerialization {
  a: Int as uint3; 
  b: Int as int128; 
  c: Int; 

  init() {
    self.a = 7;
    self.b = -42;
    self.c = 123456;
  }
}