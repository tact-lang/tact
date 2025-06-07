struct DeeplyNestedOptional {
  nest1: Level1?;
}

struct Level1 {
  nest2: Level2?;
}

struct Level2 {
  nest3: Level3?;
}

struct Level3 {
  flag: Bool;
  s: String;
}

contract TestContract {
    data: DeeplyNestedOptional = DeeplyNestedOptional{
        nest1: null
    };

    init() {
        self.data = DeeplyNestedOptional{
            nest1: Level1{
                nest2: Level2{
                    nest3: Level3{
                        flag: true,
                        s: "ok"
                    }
                }
            }
        };
    }
}
