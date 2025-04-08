struct SuperNested {
 a: Int;
 b: Bool?;
 c: String;
 d: Int?;
}

struct InnerMost {
  q: SuperNested;
}

struct MidLevel {
  im: InnerMost;
}

struct OuterMost {
  mid: MidLevel;
}

contract Insanity {
  data: OuterMost;

  init() {
    self.data = OuterMost{
      mid: MidLevel{
        im: InnerMost{
          q: SuperNested{
            a: 1,
            b: true,
            c: "x",
            d: null
          }
        }
      }
    };
  }
}