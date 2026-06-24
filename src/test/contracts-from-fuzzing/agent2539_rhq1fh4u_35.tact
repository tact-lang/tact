contract OptionalStringDefaults {
 s1: String? = null;
 s2: String? = "abc";
 s3: String? = null;

 init() {
  self.s1 = "1";
  self.s2 = null;
  self.s3 = "3";
 }
}