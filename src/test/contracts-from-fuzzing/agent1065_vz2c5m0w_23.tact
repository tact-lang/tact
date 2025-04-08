struct DeepWithOptional {
    e: Int?;
}

struct MiddleLevel {
    d: DeepWithOptional;
}

struct UpperLevel {
    c: MiddleLevel;
}

contract DeepNestedWithOptional {
    b: UpperLevel;

    init() {
        self.b = UpperLevel{
            c: MiddleLevel{
                d: DeepWithOptional{
                    e: null
                }
            }
        };
    }
}
