struct Tiny {
  small: Int?;
}

struct Larger {
  a: Tiny;
  b: Tiny;
  c: Tiny;
  d: Tiny;
  e: Tiny;
}

contract ManyStructsInOne {
    big: Larger;

    init() {
        self.big = Larger{
            a: Tiny{small:null},
            b: Tiny{small:null},
            c: Tiny{small:null},
            d: Tiny{small:null},
            e: Tiny{small:null}
        };
    }
}