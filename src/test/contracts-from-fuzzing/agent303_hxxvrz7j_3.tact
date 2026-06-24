struct DeepNestedLevel3 {
    flag: Bool;
    value: Int;
}

struct DeepNestedLevel2 {
    data3: DeepNestedLevel3;
    optionalValue: Int?;
}

struct DeepNestedLevel1 {
    data2: DeepNestedLevel2;
}

contract DeepStorage {
    nestedData: DeepNestedLevel1;

    init() {
        self.nestedData = DeepNestedLevel1{
            data2: DeepNestedLevel2{
                data3: DeepNestedLevel3{
                    flag: true,
                    value: 77,
                },
                optionalValue: null,
            },
        };
    }
}