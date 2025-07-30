// contract with explicit default values for deeply nested optionals
struct DeepDefaults {
  x: Int? = null;
  y: Bool? = true;
  z: String? = null;
}

contract DefaultsNested {
  data: DeepDefaults;
  
  init() {
    self.data = DeepDefaults{};
  }
}
