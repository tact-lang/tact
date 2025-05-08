struct OneLevel {
  a: Int;
}

struct TwoLevel {
  o: OneLevel;
}

struct ThreeLevel {
  t: TwoLevel;
}

struct FourLevel {
  th: ThreeLevel;
}

contract FourDeepNested {
  nest: FourLevel;

  init() {
    self.nest = FourLevel{
      th: ThreeLevel{
        t: TwoLevel{
          o: OneLevel{
            a: 42
          }
        }
      }
    };
  }
}