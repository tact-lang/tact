// Large nested struct, multi-level deep nesting with optional fields at each level

struct Level3 {
    x: Int?;
    y: String?;
}

struct Level2 {
    nest: Level3;
    flag: Bool?;
}

struct Level1 {
    inner: Level2;
    num: Int?;
}

contract TestContract {
    val: Level1;

    init() {
        self.val = Level1{
            inner: Level2{
                nest: Level3{ x: null, y: "hi" },
                flag: true
            },
            num: null
        };
    }
}