// stress optional of struct with optional primitives
struct ComboOpt {
  a: Int?;
  b: String?;
}

contract OptOfStructOpt {
    co: ComboOpt?;
    
    init() {
      self.co = null;
    }
}
