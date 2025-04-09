struct Pair {
    First: Int;
    Second: Int;
}

struct Level3 {
    A: Int;
}

struct Level2 {
    Inner: Level3;
    P: Pair;
}

struct Level1 {
    Maybe: Level2?;
    Number: Int;
}

contract NestedStructContract1 {
    receive() {
        let s: Level1 = Level1 {
            Maybe: Level2 {
                Inner: Level3 { A: 42 },
                P: Pair { First: 1, Second: 2 }
            },
            Number: 7
        };
    }
}
