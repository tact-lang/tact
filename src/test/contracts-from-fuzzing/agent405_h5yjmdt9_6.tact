struct Level3 {
  val: Int?;
}

struct Level2 {
  mid: Int;
  deep: Level3;
}

struct Level1 {
  top: Bool?;
  sub: Level2;
}

contract DeepChain {
    nested: Level1 = Level1{
        top: null,
        sub: Level2 {
            mid: 55,
            deep: Level3 { val: 99 }
        }
    };

    init() {
        self.nested = Level1{
            top: true,
            sub: Level2 {
                mid: 11,
                deep: Level3 { val: null }
            }
        };
    }
}