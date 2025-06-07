struct Defaults {
 x: Int = 1;
 y: Bool = true;
 s: String = "foo";
}

contract WithDefaults {
 data: Defaults;

 init() {
   self.data = Defaults{};
 }
}