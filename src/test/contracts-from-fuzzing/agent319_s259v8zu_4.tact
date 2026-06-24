struct Level3 {
    m: Bool;
    n: String;
}

struct Level2 {
    k: Level3;
    l: Int;
}

struct Level1 {
    h: Level2;
    i: Int;
    j: Address;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            h: Level2{
                k: Level3{m: true, n: "deep"},
                l: 7,
            },
            i: 42,
            j: myAddress(),
        };
    }
}