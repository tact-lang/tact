struct NestedDefault {
    num: Int = 7;
    text: String = "hello";
}

struct OuterStruct {
    nested: NestedDefault;
    flag: Bool;
}

contract OuterWithNested {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            nested: NestedDefault{},
            flag: true
        };
    }
}
