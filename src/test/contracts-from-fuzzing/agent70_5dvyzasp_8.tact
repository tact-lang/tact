struct NestedOptional {
    val: Int?;
    flag: Bool?;
}

struct Level1 {
    nested: NestedOptional?;
}

contract Test {
    top: Level1;

    init() {
        self.top = Level1{
            nested: null
        };
    }
}