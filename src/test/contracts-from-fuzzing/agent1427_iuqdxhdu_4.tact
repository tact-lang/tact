struct DeepNestedOptional {
    inner: Int?;
}

struct SecondLevel {
    nested: DeepNestedOptional?;
}

struct OuterStruct {
    second: SecondLevel?;
}

contract DeepOptionalTest {
    data: OuterStruct;
    init() {
        self.data = OuterStruct {
            second: SecondLevel {
                nested: DeepNestedOptional {
                    inner: 77
                }
            }
        };
    }
}