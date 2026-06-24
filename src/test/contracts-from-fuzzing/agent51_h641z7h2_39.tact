// Big nested variety all together
struct Deep {
  a1: Int=1;
  a2: Bool=true;
  a3: Int?;
  a4: String="x";
}
struct Wr {
  d1: Deep;
  d2: Deep;
}
contract Test {
  w: Wr;
  init() {
    self.w = Wr{
      d1: Deep{ a1: 1, a2: true, a3: null, a4: "x" },
      d2: Deep{ a1: 1, a2: true, a3: null, a4: "x" }
    };
  }
}