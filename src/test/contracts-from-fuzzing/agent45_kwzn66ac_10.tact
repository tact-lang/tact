struct DeeplyNested1 { x: Int; }
struct DeeplyNested2 { d1: DeeplyNested1; }
struct DeeplyNested3 { d2: DeeplyNested2; }
struct DeeplyNested4 { d3: DeeplyNested3; }
struct DeeplyNested5 { d4: DeeplyNested4; }

contract Nest5 {
  field: DeeplyNested5;

  init() {
    self.field = DeeplyNested5 {
      d4: DeeplyNested4 {
        d3: DeeplyNested3 {
          d2: DeeplyNested2 {
            d1: DeeplyNested1 {
              x: 42
            }
          }
        }
      }
    };
  }
}