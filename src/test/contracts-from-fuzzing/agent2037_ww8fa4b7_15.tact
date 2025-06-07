// extremely nested opt chain
struct Inner {
  x: Int?;
  y: Bool?;
}

struct Middle {
  i: Inner?;
}

struct Outer {
  m: Middle?;
}

contract DeepNullableChain {
    data: Outer;

    init() {
        self.data = Outer{
            m: Middle{
                i: Inner{
                    x: null,
                    y: null
                }
            }
        };
    }
}
