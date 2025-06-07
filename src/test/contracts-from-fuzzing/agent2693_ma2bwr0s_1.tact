struct DeepNestedLevel4 {
    finalField: Int;
}

struct DeepNestedLevel3 {
    nested4: DeepNestedLevel4;
    optional4: DeepNestedLevel4?;
}

struct DeepNestedLevel2 {
    nested3: DeepNestedLevel3;
    optional3: DeepNestedLevel3?;
}

struct DeepNestedLevel1 {
    nested2: DeepNestedLevel2;
    optional2: DeepNestedLevel2?;
}

contract NestedContract {
    rootField: DeepNestedLevel1;
    optionalRoot: DeepNestedLevel1?;

    init() {
        self.rootField = DeepNestedLevel1{
            nested2: DeepNestedLevel2{
                nested3: DeepNestedLevel3{
                    nested4: DeepNestedLevel4{ finalField: 1 },
                    optional4: null,
                },
                optional3: null,
            },
            optional2: null,
        };
        self.optionalRoot = null;
    }
}
