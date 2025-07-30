struct ExtraDeep1 { x: Int }
struct ExtraDeep2 { a: ExtraDeep1 }
struct ExtraDeep3 { b: ExtraDeep2 }
struct ExtraDeep4 { c: ExtraDeep3 }
struct ExtraDeep5 { d: ExtraDeep4 }

contract ExtraDeep {
  root: ExtraDeep5;

  init() {
    self.root = ExtraDeep5 {
      d: ExtraDeep4 {
        c: ExtraDeep3 {
          b: ExtraDeep2 {
            a: ExtraDeep1 { x: 7 }
          }
        }
      }
    };
  }
}