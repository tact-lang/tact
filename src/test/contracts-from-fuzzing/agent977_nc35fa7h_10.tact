// nested optional struct fields — without typealias
struct S1 {
  a: Int?;
}

struct S2 {
  x: S1?;
  y: Int;
}

contract CombOpt2 {
    data: S2;
    init() {
        self.data = S2{
            x: null,
            y: 42
        };
    }
}