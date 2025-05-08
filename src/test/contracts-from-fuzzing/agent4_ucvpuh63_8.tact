struct OptionalDeepNest4 { val: Int?; }
struct OptionalDeepNest3 { nest4: OptionalDeepNest4?; }
struct OptionalDeepNest2 { nest3: OptionalDeepNest3?; }
struct OptionalDeepNest1 { nest2: OptionalDeepNest2?; }

contract Test {
  nested: OptionalDeepNest1;

  init() {
    self.nested = OptionalDeepNest1{
      nest2: OptionalDeepNest2{
        nest3: OptionalDeepNest3{
          nest4: OptionalDeepNest4{ val: null }
        }
      }
    };
  }
}