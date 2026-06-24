struct Level3 {
    f1: Int?;
    f2: String?;
}
struct Level2 {
    nested: Level3;
    flag: Bool;
}
struct Level1 {
    deep: Level2;
    s: String;
}

contract NestedOptsStrings {
    val: Level1;

    init() {
        self.val = Level1{
            deep: Level2{
                nested: Level3{ f1: null, f2: null },
                flag: true
            },
            s: "deep"
        };
    }
}
