struct DeepNest {
  n1: Nested1;
}

struct Nested1 {
  n2: Nested2;
}

struct Nested2 {
  n3: Nested3;
}

struct Nested3 {
  val: Int?;
}

contract DeepTest {
  dep: DeepNest;

  init() {
    self.dep = DeepNest{
      n1: Nested1{
        n2: Nested2{
          n3: Nested3{
            val: null
          }
        }
      }
    };
  }
}
