struct Level3 {
    a: Int;
    b: String;
}

struct Level2 {
    nested: Level3;
    flag: Bool;
}

struct Level1 {
    maybe: Level2?;
    text: String;
}

contract TestContract {
    val: Level1 = Level1{ maybe: null, text: "hello" };

    init() {
        self.val = Level1{
            maybe: Level2{
                nested: Level3{ a: 99, b: "inside" },
                flag: true
            },
            text: "world"
        };
    }
}
