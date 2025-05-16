struct Lowest {
  v: Int;
}

struct Mid {
  m1: Int;
  low: Lowest?;
}

struct Top {
  t1: Int;
  mid: Mid?;
}

contract TestContract {
    complexNested: Top;
    
    init() {
        self.complexNested = Top{
            t1: 10,
            mid: Mid{
                m1: 20,
                low: Lowest{
                    v: 30
                }
            }
        };
    }
}