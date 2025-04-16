struct BigA { a1: Int; a2: Bool; a3: String; }
struct BigB { b1: Int; b2: Bool; b3: String; }
struct BigC { c1: Int; c2: Bool; c3: String; }

contract BigThree {
  first: BigA;
  second: BigB;
  third: BigC;

  init() {
    self.first = BigA { a1:1, a2:true, a3:"a" };
    self.second = BigB { b1:2, b2:false, b3:"b" };
    self.third = BigC { c1:3, c2:true, c3:"c" };
  }
}