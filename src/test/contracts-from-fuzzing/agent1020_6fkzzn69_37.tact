struct ManyDefaults {
 a: Int = 1;
 b: Bool = false;
 s: String = "x";
}

contract ManyDefaultsContract {
 f: ManyDefaults;

 init() {
   self.f = ManyDefaults{};
 }
}
