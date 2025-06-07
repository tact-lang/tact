struct A1 { x: Int }
struct A2 { y: Int }
struct A3 { z: Int }
struct A4 { w: Int }

struct Grand {
  g1: A1;
  g2: A2;
  g3: A3;
  g4: A4;
}

contract ManyStructs {
  grand: Grand;

  init() {
    self.grand = Grand{
      g1: A1{ x: 1 },
      g2: A2{ y: 2 },
      g3: A3{ z: 3 },
      g4: A4{ w: 4 }
    };
  }
}