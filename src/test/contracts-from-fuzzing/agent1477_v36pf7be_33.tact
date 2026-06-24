contract NullMix {
  a: Int? = null;
  b: Int = 0;
  c: Bool? = null;
  d: Bool = false;
  e: String? = null;
  f: String = "";

  init(){
    self.a = null; self.b = 1; self.c=null;
    self.d = true; self.e=null; self.f="hi";
  }
}