contract OnlyDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "hello";

  init(){
    self.a=2;
    self.b=true;
    self.c="world";
  }
}