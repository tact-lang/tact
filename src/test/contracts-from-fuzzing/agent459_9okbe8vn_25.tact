struct BigNestA { val: Int; }
struct BigNestB { a: BigNestA; }
struct BigNestC { b: BigNestB; }
struct BigNestD { c: BigNestC; }
struct BigNestE { d: BigNestD; }

contract BigNestedContract {
  data: BigNestE;

  init() {
    self.data = BigNestE{
      d: BigNestD{
        c: BigNestC{
          b: BigNestB{
            a: BigNestA{ val: 123 }
          }
        }
      }
    };
  }
}