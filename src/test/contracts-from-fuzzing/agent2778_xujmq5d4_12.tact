struct NestA { a: Int }
struct NestB { b: NestA }
struct NestC { c: NestB }
struct NestD { d: NestC }
contract DeepNestedFields {
  data: NestD;
  init() {
    self.data = NestD{
      d: NestC{
        c: NestB{
          b: NestA{a: 99}
        }
      }
    };
  }
}
