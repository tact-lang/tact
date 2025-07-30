struct NestedLevel3 {
    a: Int;
    b: Bool;
}

struct NestedLevel2 {
    lvl3: NestedLevel3;
    text: String;
}

struct NestedLevel1 {
    lvl2: NestedLevel2;
    number: Int;
    flag: Bool?;
}

contract DeepNestedStruct {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            lvl2: NestedLevel2{
                lvl3: NestedLevel3{
                    a: 1,
                    b: true,
                },
                text: "test",
            },
            number: 42,
            flag: null,
        };
    }
}