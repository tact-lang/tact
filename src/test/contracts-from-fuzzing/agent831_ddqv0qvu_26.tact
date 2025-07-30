struct DeeplyNested {
  n1: Int;
  n2: Int?;
  nested1: Inner1;
  nested2: Inner2;
}

struct Inner1 {
  x: Int;
  nested3: Inner3;
}

struct Inner2 {
  y: Bool;
}

struct Inner3 {
  z: String?;
}

contract ComplexNested {
  data: DeeplyNested;

  init() {
    self.data = DeeplyNested{
      n1: 7,
      n2: null,
      nested1: Inner1{
        x: 9,
        nested3: Inner3{z: null}
      },
      nested2: Inner2{y:true}
    };
  }
}
