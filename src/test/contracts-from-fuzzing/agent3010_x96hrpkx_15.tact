struct Chain1 { a: Int; }
struct Chain2 { a: Chain1; }
struct Chain3 { a: Chain2; }
struct Chain4 { a: Chain3; }
struct Chain5 { a: Chain4; }

contract LongNest {
  field: Chain5;

  init() {
    self.field = Chain5{
      a: Chain4{
        a: Chain3{
          a: Chain2{ a: Chain1{ a: 7 } }
        }
      }
    };
  }
}