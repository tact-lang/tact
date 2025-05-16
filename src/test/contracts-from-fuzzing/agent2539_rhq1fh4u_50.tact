struct MultiDefaults {
 a: Int = 1;
 b: Bool = true;
 c: String = "s";
}

contract DefaultsInStruct {
 f: MultiDefaults = MultiDefaults{};

 init() {
  self.f = MultiDefaults{a:42,b:false,c:"x"};
 }
}