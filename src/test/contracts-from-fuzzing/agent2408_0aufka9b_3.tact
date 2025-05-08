struct DeepNestedLevel3 {
    main: Int?;
}

struct DeepNestedLevel2 {
    level3: DeepNestedLevel3;
}

struct DeepNestedLevel1 {
    level2: DeepNestedLevel2;
}

contract DeepNestOptTest {
    state: DeepNestedLevel1;

    init() {
        self.state = DeepNestedLevel1{
            level2: DeepNestedLevel2{
                level3: DeepNestedLevel3{
                    main: null,
                }
            }
        };
    }
}