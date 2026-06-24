struct OptNested {
    a: Int?;
    b: Bool?;
}

struct MultiLevel {
    level1: OptNested?;
    level2: OptNested?;
}

contract Test {
    val: MultiLevel;
    init() {
        self.val = MultiLevel{ level1:null, level2:null };
    }
}