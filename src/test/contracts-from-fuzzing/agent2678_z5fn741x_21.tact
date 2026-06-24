struct NestedOptional {
    val: Int?;
    str: String?;
}

struct Outer {
    nested: NestedOptional?;
    num: Int;
}

contract NestedOptStruct {
    data: Outer;

    init() {
        self.data = Outer{
            nested: NestedOptional{val: 9, str: null},
            num: 5
        };
    }
}