struct DeeplyNested {
  nested1: Inner1;
}

struct Inner1 {
  nested2: Inner2;
}

struct Inner2 {
  nested3: Inner3;
}

struct Inner3 {
  value: Int;
}

contract TestNested {
  data: DeeplyNested;

  init() {
    self.data = DeeplyNested{
      nested1: Inner1{
        nested2: Inner2{
          nested3: Inner3{
            value: 42
          }
        }
      }
    };
  }
}
