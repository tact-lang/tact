struct NestedWithOptionals {
    a: Int?;
    s: String?;
}

struct MainStruct {
    flag: Bool;
    nested: NestedWithOptionals;
    num: Int;
}

contract NestedOptions {
    field: MainStruct;

    init() {
        self.field = MainStruct{
            flag: true,
            nested: NestedWithOptionals{
                a: null,
                s: null
            },
            num: 55
        };
    }
}