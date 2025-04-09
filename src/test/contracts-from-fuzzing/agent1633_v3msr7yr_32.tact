struct InA { x: Int }
struct InB { a: InA }
struct InC { b: InB }
struct InD { c: InC }
struct InE { d: InD }

contract DeepFieldsTest {
  storage: InE;

  init() {
    self.storage = InE{
      d: InD{
        c: InC{
          b: InB{
            a: InA{
              x: 77
            }
          }
        }
      }
    };
  }
}