struct StructWithDefaults {
 x: Int = 7;
 y: Bool = true;
 z: String = "hi";
}

contract UseStructWithDefaults {
 s: StructWithDefaults;

 init() {
   self.s = StructWithDefaults{};
 }
}