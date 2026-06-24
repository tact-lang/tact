struct Tiny {
  i: Int;
}

struct Layer2 {
  t: Tiny;
}

struct Layer3 {
  l2: Layer2;
}

struct Layer4 {
  l3: Layer3;
}

contract VeryDeep {
  field: Layer4;

  init() {
    self.field = Layer4{
      l3: Layer3{
        l2: Layer2{
          t: Tiny{
            i: 123
          }
        }
      }
    };
  }
}