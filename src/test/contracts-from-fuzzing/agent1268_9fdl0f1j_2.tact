struct NestedLevel3 {
    flag: Bool;
}

struct NestedLevel2 {
    data: NestedLevel3;
}

struct NestedLevel1 {
    data: NestedLevel2;
}

contract NestedStructContract {
    item: NestedLevel1;

    init() {
        self.item = NestedLevel1{
            data: NestedLevel2{
                data: NestedLevel3{
                    flag: true,
                },
            },
        };
    }
}