contract NullableDefaults {
   oi: Int? = null;
   ob: Bool? = null;

   init() {
       self.oi = null;
       self.ob = null;
   }
}