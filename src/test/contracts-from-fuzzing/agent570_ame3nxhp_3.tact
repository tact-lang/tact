contract Test {
  a: Int;              // default int257
  b: Int as uint1;    
  c: Int as int8;
  d: Int as uint32;
  e: Int as int128;
  f: Bool; 

  init() {
    self.a = 1;
    self.b = 1;
    self.c = 1;
    self.d = 1;
    self.e = 1;
    self.f = true;
  }
}