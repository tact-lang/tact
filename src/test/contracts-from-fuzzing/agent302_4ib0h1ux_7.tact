contract OptsAndDefaults {
  var1: Int?;
  var2: Bool? = null;
  var3: String? = null;
  var4: Int = 10;
  var5: Bool = false;
  var6: String = "hello";

  init() {
    self.var1 = null;
    self.var2 = true;
    self.var3 = "world";
    self.var4 = 42;
    self.var5 = true;
    self.var6 = "done";
  }
}