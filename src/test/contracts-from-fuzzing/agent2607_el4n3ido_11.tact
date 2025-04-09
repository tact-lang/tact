// deeply nested optional in struct fields
struct L3 {
    x: Int;
}

struct L2 {
    nested: L3?;
}

struct L1 {
    deep: L2?;
}

contract StructDeepNest {
    val: L1;

    init() {
        self.val = L1{
            deep: null
        };
    }
}
