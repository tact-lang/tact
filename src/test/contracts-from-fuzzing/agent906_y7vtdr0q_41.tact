struct Layer1 {
  a: Int;
}

struct Layer2 {
  l1: Layer1;
}

struct Layer3 {
  l2: Layer2;
}

contract TopLayer {
  data: Layer3;

  init() {
    self.data = Layer3{
      l2: Layer2{
        l1: Layer1{
          a: 7,
        },
      },
    };
  }
}