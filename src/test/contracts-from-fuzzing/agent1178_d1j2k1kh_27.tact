// test deeply nested optionals
struct Opt1 { x: Int?; }
struct Opt2 { x: Opt1?; }
struct Opt3 { x: Opt2?; }

contract Test {
  data: Opt3;
  init() {
    self.data = Opt3{
      x: Opt2{
        x: null
      }
    };
  }
}