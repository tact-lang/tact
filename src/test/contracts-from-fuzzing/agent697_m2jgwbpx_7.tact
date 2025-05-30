struct OptionalNest {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract Test {
  data: OptionalNest = OptionalNest{ a:null, b:null, c:null };

  init() {
    self.data = OptionalNest{ a:5, b:true, c:"x" };
  }

  receive() {}
}