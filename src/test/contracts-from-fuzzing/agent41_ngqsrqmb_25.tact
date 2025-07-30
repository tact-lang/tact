// A nested struct with optional nested struct field
struct Level2 {
    n: Int;
    optS: String?;
}

struct Level1 {
    nested: Level2?;
    txt: String;
}

contract NestedOptionalStructs {
    s: Level1;
    init() {
        self.s = Level1{
            nested: null,
            txt: "test",
        };
    }
}