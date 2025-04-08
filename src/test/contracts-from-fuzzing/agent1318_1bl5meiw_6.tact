struct LargeNested1 {
  x1: Int;
  x2: Bool;
}

struct LargeNested2 {
  y1: String;
  y2: LargeNested1;
}

struct LargeNested3 {
  z1: Int?;
  z2: LargeNested2;
}

contract LargeStructField {
    field: LargeNested3;

    init() {
        self.field = LargeNested3{
            z1: null,
            z2: LargeNested2{
                y1: "abc",
                y2: LargeNested1{
                    x1: 123,
                    x2: true
                }
            }
        };
    }
}