struct DeepOptional {
    level: Int?;
}

struct MiddleOptional {
    nested: DeepOptional;
}

struct OuterOptional {
    nested: MiddleOptional;
    name: String;
}

contract TestContract {
    s: OuterOptional = OuterOptional{
        nested: MiddleOptional{
            nested: DeepOptional{
                level: null
            }
        },
        name: "test"
    };

    init() {
        self.s = OuterOptional{
            nested: MiddleOptional{
                nested: DeepOptional{
                    level: null
                }
            },
            name: "test"
        };
    }
}