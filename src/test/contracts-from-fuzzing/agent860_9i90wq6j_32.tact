contract OptionalAfterDefaults {
  a: Int = 1;
  b: Bool = true;
  c: String?;

  init() {
    self.a=2;
    self.b=false;
    self.c=null;
  }
}