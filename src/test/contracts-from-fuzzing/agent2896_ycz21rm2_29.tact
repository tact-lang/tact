contract MixDefaultsInit {
 a: Int = 0;
 b: Bool = false;
 c: String = "";
 d: Int? = null;

 init() {
  self.a = 1;
  self.b = true;
  self.c = "hi";
  self.d = 555;
 }
}