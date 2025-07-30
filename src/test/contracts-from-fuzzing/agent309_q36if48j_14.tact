struct Layer3 {
  x: Int;
  y: Bool;
}

struct Layer2 {
  inner: Layer3;
  flag: Bool;
}

struct Layer1 {
  inner: Layer2;
  n: Int;
}

contract DeepLayersStorage {
  s: Layer1;

  init() {
    self.s = Layer1{
      inner: Layer2{
        inner: Layer3{
          x:123,
          y:true
        },
        flag: false
      },
      n:999
    };
  }
}