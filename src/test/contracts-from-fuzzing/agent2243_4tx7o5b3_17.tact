struct NestedLvl3 {
    val: Int;
}

struct NestedLvl2 {
    sub: NestedLvl3?;
}

struct NestedLvl1 {
    node: NestedLvl2?;
}

contract DeepNullOptionals {
    data: NestedLvl1;

    init() {
        self.data = NestedLvl1{
            node: null
        };
    }
}
