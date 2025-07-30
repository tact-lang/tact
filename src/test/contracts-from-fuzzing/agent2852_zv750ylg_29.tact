struct MixDefaults {
    a: Int = 1;
    b: Bool;
    c: String = "hi";
    d: Address;
}

contract MixDefaultsTest {
    x: MixDefaults;
  
    init() {
      self.x = MixDefaults{ b:true, d:myAddress() };
    }
}