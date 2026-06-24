struct Layer3 {
  x: Int;
  y: Bool?;
}

struct Layer2 {
  nested3: Layer3;
  txt: String;
}

struct Layer1 {
  nested2: Layer2;
  flag: Bool;
  optStr: String?;
}

contract LayeredDeep {
  data: Layer1;

  init() {
    self.data = Layer1{
      nested2: Layer2{
        nested3: Layer3{
          x: 42,
          y: null
        },
        txt: "hello"
      },
      flag: true,
      optStr: null
    };
  }
}