struct Deep1 { val: Int; }
struct Deep2 { nested: Deep1; }
struct Deep3 { nested: Deep2; }
struct Deep4 { nested: Deep3; }
struct Deep5 { nested: Deep4; }

contract DeeplyNestedStructsTest {
  storage: Deep5;

  init() {
    self.storage = Deep5{
      nested: Deep4{
        nested: Deep3{
          nested: Deep2{
            nested: Deep1{ val: 42 }
          }
        }
      }
    };
  }
}