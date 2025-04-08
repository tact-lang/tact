struct NestA { inner: NestB; }
struct NestB { inner: NestC; }
struct NestC { inner: NestD; }
struct NestD { inner: NestE; }
struct NestE { val: Int; }

contract Nest5 {
  s: NestA;

  init() {
    self.s = NestA{
      inner:NestB{
        inner:NestC{
          inner:NestD{
            inner:NestE{
              val: 555
            }
          }
        }
      }
    };
  }
}