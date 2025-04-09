struct A { x: Int }
struct B { y: Int }

contract ManyVars {
  a1: A; a2: A; a3: A; a4: A; a5: A;
  b1: B; b2: B; b3: B; b4: B; b5: B;

  init() {
    self.a1 = A{ x: 1 };
    self.a2 = A{ x: 2 };
    self.a3 = A{ x: 3 };
    self.a4 = A{ x: 4 };
    self.a5 = A{ x: 5 };

    self.b1 = B{ y: 6 };
    self.b2 = B{ y: 7 };
    self.b3 = B{ y: 8 };
    self.b4 = B{ y: 9 };
    self.b5 = B{ y: 10 };
  }
}