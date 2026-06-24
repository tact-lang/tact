// persist nested struct with nested default optional inside
struct DeepOptDef {
    a: Int? = null;
    b: Bool = true;
}

struct Level1 {
    x: DeepOptDef? = null;
    y: String = "hello";
}

contract NestedDefaultOpt {
    val: Level1;

    init() {
        self.val = Level1{};
    }
}