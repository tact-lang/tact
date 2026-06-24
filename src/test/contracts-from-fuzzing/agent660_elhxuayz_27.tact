struct DeepNestA { val: Int; }
struct DeepNestB { a: DeepNestA; }
struct DeepNestC { b: DeepNestB; }
struct DeepNestD { c: DeepNestC; }
struct DeepNestE { d: DeepNestD; }
struct DeepNestF { e: DeepNestE; }

contract DeepNestingTest {
  st: DeepNestF;

  init() {
    self.st = DeepNestF{
      e: DeepNestE{
        d: DeepNestD{
          c: DeepNestC{
            b: DeepNestB{
              a: DeepNestA{ val: 42 }
            }
          }
        }
      }
    };
  }
}