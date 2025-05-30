struct Tier3 {
  foo: String?;
}

struct Tier2 {
  t3opt: Tier3?;
}

struct Tier1 {
  t2opt: Tier2?;
}

contract OptOptOpt {
  data: Tier1?;

  init() {
    self.data = Tier1{
      t2opt: Tier2{
        t3opt: Tier3{
          foo: "deep"
        }
      }
    };
  }
}