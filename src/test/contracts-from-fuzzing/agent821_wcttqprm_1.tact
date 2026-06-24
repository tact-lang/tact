struct DeepNestedLevel {
    innermost: Int;
}

struct MiddleLayer {
    nested: DeepNestedLevel;
}

struct OuterLayer {
    mid: MiddleLayer;
}

contract TestDeepNested {
    data: OuterLayer = OuterLayer{
        mid: MiddleLayer{
            nested: DeepNestedLevel{innermost: 123}
        }
    };

    init() {
        self.data = OuterLayer{
            mid: MiddleLayer{
                nested: DeepNestedLevel{innermost: 456}
            }
        };
    }
}
