struct Level3 {
    a: Int;
    b: String;
}

struct Level2 {
    l3: Level3;
    f: Bool;
}

struct Level1 {
    l2: Level2;
    s: String;
}

contract Nestings {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{ l3: Level3{ a:1,b:"b" }, f:true },
            s: "hello" };
    }
}
