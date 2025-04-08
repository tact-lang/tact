struct NestedLevel2 {
    flag: Bool;
    name: String;
}

struct NestedLevel1 {
    number: Int;
    child: NestedLevel2;
}

struct OuterStruct {
    count: Int;
    nested: NestedLevel1;
}

contract MultiNestedStruct {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            count: 7,
            nested: NestedLevel1{
                number: 42,
                child: NestedLevel2{
                    flag: true,
                    name: "level 2"
                }
            }
        };
    }
}