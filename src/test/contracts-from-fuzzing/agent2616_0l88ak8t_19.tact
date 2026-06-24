struct Nest1 { a: Int?; }
struct Nest2 { n: Nest1?; }
struct Nest3 { n: Nest2?; }
struct Nest4 { n: Nest3?; }

contract DeepOptional {
  d: Nest4;

  init() {
    self.d = Nest4{n: Nest3{n: Nest2{n: Nest1{a: 1}}}};
  }
}