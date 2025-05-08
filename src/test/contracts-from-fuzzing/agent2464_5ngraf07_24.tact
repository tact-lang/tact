struct OptionalDeep {
  x: OptionalMid?;
}

struct OptionalMid {
  y: OptionalInner?;
}

struct OptionalInner {
  val: Int?;
}

contract DeepOptOpt {
    s: OptionalDeep;

    init() {
        self.s = OptionalDeep{
            x: OptionalMid{
                y: OptionalInner{
                    val: null
                }
            }
        };
    }
}
