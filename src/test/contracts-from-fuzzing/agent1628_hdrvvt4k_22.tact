// optional of struct with multiple optional fields
struct OptStruct {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract TestContract {
  x: OptStruct?;

  init() {
    self.x = OptStruct{
      a: null,
      b: true,
      c: null
    };
  }
}