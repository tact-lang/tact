// 2-layer nested struct where bottom layer uses optionals and one normal field
struct Bottom {
  a: Int?;
  b: Bool?;
  c: String;
}

struct Top {
  inner: Bottom;
}

contract NestOptsNorm {
    v: Top;

    init() {
        self.v = Top{
            inner: Bottom{
                a:null,
                b:null,
                c:"hi"
            }
        };
    }
}