contract OptionDefaults {
   a: Int? = null;
   b: Bool? = null;
   c: String? = null;

   init() {
      self.a = 15;
      self.b = false;
      self.c = "yo";
   }
}