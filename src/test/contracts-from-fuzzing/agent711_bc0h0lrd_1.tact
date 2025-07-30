struct DeepNestedOptionals {
    n: OptionLevel1?;
}

struct OptionLevel1 {
    n: OptionLevel2?;
}

struct OptionLevel2 {
    n: OptionLevel3?;
}

struct OptionLevel3 {
    value: Int?;
}

contract TestContract {
    data: DeepNestedOptionals;

    init() {
        self.data = DeepNestedOptionals{
            n: OptionLevel1{
                n: OptionLevel2{
                    n: OptionLevel3{
                        value: 42
                    }
                }
            }
        };
    }
}
