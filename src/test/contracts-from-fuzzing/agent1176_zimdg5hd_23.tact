struct A { name: String; age: Int; }
struct B { name: String; flag: Bool; }

contract TwoSameNames {
  a: A;
  b: B;

  init() {
    self.a = A{ name: "X", age: 30 };
    self.b = B{ name: "Y", flag: true };
  }
}