struct DeepNested1 {
    val: Int;
}

struct DeepNested2 {
    nested: DeepNested1;
}

struct DeepNested3 {
    nested: DeepNested2;
}

contract DeepNestingContract {
    field: DeepNested3;

    init() {
        self.field = DeepNested3{
            nested: DeepNested2{
                nested: DeepNested1{val: 999}
            }
        };
    }
}