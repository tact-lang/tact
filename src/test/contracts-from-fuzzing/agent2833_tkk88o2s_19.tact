struct LongChain {
  a: Int;
  b: LevelB;
}

struct LevelB {
  c: Int;
  d: LevelC;
}

struct LevelC {
  e: Int;
  f: LevelD;
}

struct LevelD {
  g: Int;
}

contract NestedLevels {
  field: LongChain;
  init() {
    self.field = LongChain{
      a:1,
      b: LevelB{
        c:2,
        d: LevelC{
          e:3,
          f: LevelD{
            g:4
          }
        }
      }
    };
  }
}