struct Level3 {
    x: Int;
}

struct Level2 {
    l3: Level3;
    f: Bool;
}

struct Level1 {
    l2: Level2;
    s: String;
}

contract TestContract {
    deep: Level1;

    init() {
        self.deep = Level1{
            l2: Level2{
                l3: Level3{ x: 42 },
                f: true
            },
            s: "nested"
        };
    }
}