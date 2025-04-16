struct NestedLevel2 {
    fieldA: Bool;
    fieldB: Int;
}

struct NestedLevel1 {
    subField: NestedLevel2;
    optionalInt: Int?;
}

struct MainStruct {
    nested: NestedLevel1;
    flag: Bool;
}

contract NestedStructContract {
    data: MainStruct;

    init() {
        self.data = MainStruct{
            nested: NestedLevel1{
                subField: NestedLevel2{ fieldA: true, fieldB: 42 },
                optionalInt: null
            },
            flag: false
        };
    }
}