struct S1 {
  x: Int;
}

struct S2 {
  y: Bool;
}

struct Mix {
  s1: S1;
  s2: S2;
  optInt: Int?;
  optBool: Bool?;
}

contract Mixing {
    m: Mix;
    
    init() {
        self.m = Mix{
            s1: S1{x: 123},
            s2: S2{y: false},
            optInt: null,
            optBool: true
        };
    }
}