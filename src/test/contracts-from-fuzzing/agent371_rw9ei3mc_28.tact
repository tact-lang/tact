struct Level2 {
    a: Int?;
    b: Bool?;
}

struct Level1 {
    nested: Level2?;
    c: String;
}

contract NestedOptionalStructOpt {
    val: Level1;

    init() {
        self.val = Level1{
            nested: null,
            c: "ok"
        };
    }
}