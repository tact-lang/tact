struct OuterWithDef {
    nested: NestedWithDef;
}

struct NestedWithDef {
    val: Int = 100;
}

contract OuterDefault {
    data: OuterWithDef;

    init() {
        self.data = OuterWithDef{
            nested: NestedWithDef{}
        };
    }
}