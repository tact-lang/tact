struct Level3 { a: Int; b: Bool; }

struct Level2 { sub: Level3; str: String; }

struct Level1 { sub: Level2; flag: Bool?; }

contract DeepContract {
    val: Level1;

    init() {
        self.val = Level1{
            sub: Level2{
                sub: Level3{ a:1, b:true },
                str: "deep",
            },
            flag: false,
        };
    }
}