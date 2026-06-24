struct Tiny {
  x: Int;
}

struct Medium {
  x1: Tiny;
  x2: Tiny;
  x3: Tiny;
  x4: Tiny;
}

struct Large {
  a: Medium;
  b: Medium;
  c: Medium;
}

contract NestingWideDeep {
  data: Large;
  init() {
    self.data = Large{
      a: Medium{
        x1:Tiny{x:1}, x2:Tiny{x:2}, x3:Tiny{x:3}, x4:Tiny{x:4}
      },
      b: Medium{
        x1:Tiny{x:5}, x2:Tiny{x:6}, x3:Tiny{x:7}, x4:Tiny{x:8}
      },
      c: Medium{
        x1:Tiny{x:9}, x2:Tiny{x:10}, x3:Tiny{x:11}, x4:Tiny{x:12}
      }
    };
  }
}