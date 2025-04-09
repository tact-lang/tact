// deeply nested with optionals inside the nested structs
struct L3 {
  x: Int?;
  y: Bool?;
}

struct L2 {
  a: L3;
}

struct L1 {
  a: L2;
}

contract DeepOptNest {
  f: L1;

  init() {
    self.f = L1{ a: L2{ a: L3{ x:null, y:null } } };
  }
}