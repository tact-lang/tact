struct DeepNestedLevel3 { a: Int; }

struct DeepNestedLevel2 { lvl3: DeepNestedLevel3; }

struct DeepNestedLevel1 { lvl2: DeepNestedLevel2; }

contract DeepNestedFields {
    data: DeepNestedLevel1;

    init() {
        self.data = DeepNestedLevel1{
            lvl2: DeepNestedLevel2{
                lvl3: DeepNestedLevel3{
                    a: 123,
                }
            }
        };
    }
}