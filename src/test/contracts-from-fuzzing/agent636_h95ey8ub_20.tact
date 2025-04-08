struct ManyNestedOptionals {
    a: LevelA?;
}

struct LevelA {
    b: LevelB?;
}

struct LevelB {
    c: LevelC?;
}

struct LevelC {
    finalVal: Int;
}

contract MultiLayeredOptionals {
    nested: ManyNestedOptionals;
    init() {
        self.nested = ManyNestedOptionals{
            a: LevelA{
                b: LevelB{
                    c: LevelC{
                        finalVal: 999
                    }
                }
            }
        };
    }
}