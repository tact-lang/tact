struct NestedStructWithOptionals {
    level1: L1;
}

struct L1 {
    level2: L2?;
}

struct L2 {
    level3: L3?;
}

struct L3 {
    data: Int;
}

contract TestContract {
    store: NestedStructWithOptionals;

    init() {
        self.store = NestedStructWithOptionals{
            level1: L1{
                level2: null
            }
        };
    }
}