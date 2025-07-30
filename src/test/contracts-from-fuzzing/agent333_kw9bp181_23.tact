struct NestedOptional {
    x: Int?;
}

struct MiddleOptional {
    inn: NestedOptional?;
}

struct OuterStruct {
    mid: MiddleOptional;
    val: Int;
}

contract TestContract {
    out: OuterStruct;

    init() {
        self.out = OuterStruct{
            mid: MiddleOptional { inn: null },
            val: 55
        };
    }
}