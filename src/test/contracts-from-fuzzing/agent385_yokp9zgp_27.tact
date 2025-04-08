struct LevelA { next: LevelB }
struct LevelB { next: LevelC }
struct LevelC { next: LevelD }
struct LevelD { next: LevelE }
struct LevelE { val: Int }

contract NestingFiveLevels {
    nested: LevelA;

    init() {
        self.nested = LevelA{
            next: LevelB{
                next: LevelC{
                    next: LevelD{
                        next: LevelE{
                            val: 42
                        }
                    }
                }
            }
        };
    }
}